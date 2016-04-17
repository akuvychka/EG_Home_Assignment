package core.view.mediators.windows {
import com.framework.base.view.mediators.AbstractModalMediator;

import core.model.models.ErrorModel;

import core.view.views.windows.ErrorWindowView;


public class ErrorWindowMediator extends AbstractModalMediator{
    [Inject]
    public var view:ErrorWindowView;
    [Inject]
    public var errorModel:ErrorModel;

    public function ErrorWindowMediator() {
    }

    override protected function complete():void {
        view.setErrorKey(errorModel.errorDecr);
    }

}
}
