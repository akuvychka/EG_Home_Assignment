package core.model.service {
import com.framework.base.model.interfaces.IAssetModel;
import com.framework.base.model.interfaces.IResourceLoaderModel;
import com.framework.base.model.interfaces.IResourceLoaderService;
import com.framework.base.model.models.AssetModel;
import com.framework.base.model.services.AbstractService;
import com.greensock.TweenLite;

import core.controller.signals.ShowClientSignal;

import core.model.interfaces.IStartClientService;

public class StartClientService extends AbstractService implements IStartClientService {
    [Inject]
    public var showClientSignal:ShowClientSignal;
    [Inject]
    public var resourceLoader:IResourceLoaderService;
    [Inject]
    public var resourceLoaderModel:IResourceLoaderModel;

    public function startClient():void {
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
