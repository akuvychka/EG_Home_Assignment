package core.controller.commands.components {
import core.model.interfaces.ICollageService;

import org.robotlegs.mvcs.SignalCommand;

public class AddNewPhotoCommand extends SignalCommand {
    [Inject]
    public var removedModelUid:int;
    [Inject]
    public var service:ICollageService;

    public function AddNewPhotoCommand() {
    }

    override public function execute():void {
        service.changePhoto(removedModelUid);
    }
}
}
