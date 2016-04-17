package core.view.mediators {
import com.framework.base.view.mediators.AbstractMediator;

import core.controller.signals.GenerateCollageSignal;

import core.controller.signals.OpenImageConfigSignal;
import core.controller.signals.errors.ShowErrorSignal;
import core.model.models.GeneralSettingsModel;
import core.view.views.TopMenuView;

public class TopMenuMediator extends AbstractMediator {

    [Inject]
    public var view:TopMenuView;
    [Inject]
    public var openCfgSignal:OpenImageConfigSignal;
    [Inject]
    public var generateSignal:GenerateCollageSignal;
    [Inject]
    public var generateSettings:GeneralSettingsModel;
    [Inject]
    public var errorSignal:ShowErrorSignal;

    public function TopMenuMediator() {
    }

    override protected function complete():void {
       view.openCfgSignal.add(onOpenCfg);
       view.generateSignal.add(onGenerate);
       view.loadFilesSignal.add(onLoadFiles);
    }

    private function onOpenCfg():void {
        openCfgSignal.dispatch();
    }

    private function onLoadFiles():void {
        errorSignal.dispatch("soon");
    }

    private function onGenerate():void {
        if (generateSettings.currentList != null){
            generateSignal.dispatch();
        } else {
            errorSignal.dispatch("choose_photos");
        }
    }

}
}
