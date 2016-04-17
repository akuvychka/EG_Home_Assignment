package core.model.service {
import com.framework.base.model.interfaces.IAssetModel;
import com.framework.base.model.interfaces.IResourceLoaderModel;
import com.framework.base.model.interfaces.IResourceLoaderService;
import com.framework.base.model.models.AssetModel;
import com.framework.base.model.services.AbstractService;
import core.controller.signals.ShowClientSignal;
import core.model.interfaces.IStartClientService;
import core.model.models.GeneralSettingsModel;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.geom.Point;
import flash.net.URLLoader;
import flash.net.URLRequest;

public class StartClientService extends AbstractService implements IStartClientService {
    [Inject]
    public var showClientSignal:ShowClientSignal;
    [Inject]
    public var resourceLoader:IResourceLoaderService;
    [Inject]
    public var resourceLoaderModel:IResourceLoaderModel;
    [Inject]
    public var settingsModel:GeneralSettingsModel;


    public function startClient():void {
        var loader:URLLoader = new URLLoader()
        loader.addEventListener(Event.COMPLETE, onConfigLoad);
        loader.addEventListener(IOErrorEvent.IO_ERROR, onConfigError);
        loader.load(new URLRequest("settings.xml"));
    }

    private function onConfigLoad(event:Event):void {
        event.target.removeEventListener(Event.COMPLETE, onConfigLoad);
        event.target.removeEventListener(IOErrorEvent.IO_ERROR, onConfigError);
        var settingsXML:XML = XML(event.target.data);
        settingsModel.collageSize = new Point(int(settingsXML.cWidth), int(settingsXML.cHeigth));
        settingsModel.maxRows = settingsXML.maxRows;
        settingsModel.minRows = settingsXML.minRows;
        resourceLoader.setMainPath(settingsXML.path);
        loadAssets();
    }

    private function onConfigError(event:IOErrorEvent):void {
        event.target.removeEventListener(Event.COMPLETE, onConfigLoad);
        event.target.removeEventListener(IOErrorEvent.IO_ERROR, onConfigError);
        trace("File not found")//TODO: Create error window for showing
    }

    private function loadAssets():void {
        resourceLoaderModel.bindModelPropertyOnMethod(this, "loadingComplete", onLoadingComplete);
        resourceLoader.revision = 0;
        resourceLoader.lang = "en";
        resourceLoader.addSwfToConfig("assets/swf/lang/fonts_en.swf");
        var additionalAsset:IAssetModel = new AssetModel();
        additionalAsset.assetName = "lang";
        additionalAsset.path = "base.xml";
        additionalAsset.type = "XML";

        resourceLoader.addAssetToConfig(additionalAsset);
        resourceLoader.loadByConfig("assets/config/config.json");
    }

    private function onLoadingComplete(loadingComplete:Boolean):void {
        if (loadingComplete) {
            resourceLoaderModel.unBindModelPropertyOnMethod(this, "loadingComplete", onLoadingComplete);
            showClientSignal.dispatch();
        }
    }


}
}
