package core.controller.commands {
import com.framework.base.controller.signals.RemoveModuleViewsSignal;

import core.model.interfaces.ICollageService;
import core.model.models.CollageModel;
import core.model.models.GeneralSettingsModel;

import flash.display.Bitmap;

import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.net.URLRequest;

import org.robotlegs.mvcs.SignalCommand;

public class GenerateCollageCommand extends SignalCommand {
    [Inject]
    public var remove:RemoveModuleViewsSignal;
    [Inject]
    public var service:ICollageService;
    [Inject]
    public var collageModel:CollageModel;
    [Inject]
    public var generalSettings:GeneralSettingsModel;

    private var _itemIndex:int;
    private var _loader:Loader;

    public function GenerateCollageCommand() {
    }

    override public function execute():void {
        _itemIndex = -1;
        tryLoadNext();
    }

    private function tryLoadNext():void {
        _itemIndex++;
        if (_itemIndex < generalSettings.currentList.length) {
            _loader = new Loader();
            _loader.contentLoaderInfo.addEventListener(Event.COMPLETE, imageLoaded);
            _loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onLoadError);
            _loader.load(new URLRequest(generalSettings.currentList[_itemIndex]));
        } else {
            onListLoaded();
        }

    }

    private function onLoadError(event:IOErrorEvent):void {
        _loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, imageLoaded);
        _loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onLoadError);
        trace("[ERROR] "+ event.toString());
        tryLoadNext();
    }

    private function imageLoaded(event:Event):void {
        _loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, imageLoaded);
        _loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onLoadError);
        collageModel.addImage(_loader.content as Bitmap);
        tryLoadNext();
    }

    private function onListLoaded():void {
        service.generate();
    }
}
}
