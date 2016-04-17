package core.controller.commands {
import core.controller.signals.errors.ShowErrorSignal;
import core.model.models.GeneralSettingsModel;

import flash.events.Event;
import flash.net.FileFilter;
import flash.net.FileReference;

import org.robotlegs.mvcs.SignalCommand;

public class OpenImageConfigCommand extends SignalCommand {
    [Inject]
    public var settingsModel:GeneralSettingsModel;
    [Inject]
    public var errorSignal:ShowErrorSignal;

    private var _fileRef:FileReference;

    public function OpenImageConfigCommand() {
        super();
    }

    override public function execute():void {
        super.execute();

        _fileRef = new FileReference();
        _fileRef.browse([new FileFilter("Configs", "*.json")]);
        _fileRef.addEventListener(Event.SELECT, selectHandler);

    }

    private function selectHandler(event:Event):void {
        _fileRef.addEventListener(Event.COMPLETE, onOpen);
        _fileRef.load();
    }

    private function onOpen(event:Event):void {
        try {
            settingsModel.currentList = JSON.parse(_fileRef.data.toString()).list;
        } catch (error:Error) {
            errorSignal.dispatch("wrong_cfg");
        }
        if (settingsModel.currentList == null){
            errorSignal.dispatch("choose_photos");
        }
    }

}
}
