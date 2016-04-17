package core.controller.commands.errors {
import com.framework.base.controller.signals.AddViewSignal;
import com.framework.base.model.components.AddViewVO;

import core.model.models.ErrorModel;
import core.view.views.windows.ErrorWindowView;

import org.robotlegs.mvcs.SignalCommand;

public class ShowErrorCommand extends SignalCommand {
    [Inject]
    public var errorDescription:String;
    [Inject]
    public var errorModel:ErrorModel;
    [Inject]
    public var addViewSignal:AddViewSignal;

    public function ShowErrorCommand() {
        super();
    }

    override public function execute():void {
        errorModel.errorDecr = errorDescription;
        var addViewVO:AddViewVO = new AddViewVO();
        addViewVO.viewClassRef = ErrorWindowView;
        addViewSignal.dispatch(addViewVO);
    }
}
}
