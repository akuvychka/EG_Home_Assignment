package core.controller.commands {
import core.model.interfaces.IStartClientService;

import org.robotlegs.mvcs.SignalCommand;

public class StartClientCommand extends SignalCommand {
    [Inject]
    public var startClientService:IStartClientService;

    public function StartClientCommand() {
        super();
    }

    override public function execute():void {
        super.execute();

        startClientService.startClient();
        trace("start command executed")
    }
}
}
