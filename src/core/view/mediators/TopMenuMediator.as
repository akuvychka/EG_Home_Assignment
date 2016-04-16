package core.view.mediators {
import com.framework.base.view.mediators.AbstractMediator;

import core.controller.signals.OpenImageConfigSignal;
import core.view.views.TopMenuView;

import flash.events.Event;

import flash.net.FileReference;
import flash.net.URLRequest;

public class TopMenuMediator extends AbstractMediator {

    [Inject]
    public var view:TopMenuView;
    [Inject]
    public var openCfgSignal:OpenImageConfigSignal;

    public function TopMenuMediator() {
    }

    override protected function complete():void {
       view.openCfgSignal.add(onOpenCfg)
    }

    private function onOpenCfg():void {
        openCfgSignal.dispatch();
    }


}
}
