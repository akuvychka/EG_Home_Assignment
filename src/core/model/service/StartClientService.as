package core.model.service {
import com.framework.base.model.services.AbstractService;

import core.controller.signals.ShowClientSignal;

import core.model.interfaces.IStartClientService;

public class StartClientService extends AbstractService implements IStartClientService {
    [Inject]
    public var showClientSignal:ShowClientSignal;

    public function startClient():void {
        showClientSignal.dispatch();
        trace("start service")
    }

}
}
