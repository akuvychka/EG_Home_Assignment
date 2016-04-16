package core.view.views {
import com.framework.base.view.views.AbstractView;
import com.framework.base.view.views.components.ExtendedButton;
import com.framework.utils.LocalizationUtils;

import core.consts.LayersNameConst;

import flash.events.MouseEvent;

import org.osflash.signals.Signal;

public class TopMenuView extends AbstractView {
    public var btnGenerate:ExtendedButton;
    public var btnOpenCfg:ExtendedButton;
    public var btnChooseFiles:ExtendedButton;

    private var _openCfgSignal:Signal = new Signal();

    public function TopMenuView() {
        linkage = "gui_top_mc";
        layerName = LayersNameConst.MENU_LAYER;
    }

    override protected function complete():void {
        btnOpenCfg.addEventListener(MouseEvent.CLICK, onOpenCfg);
        btnGenerate.setTextByKey("top_menu_generate_button")
        btnOpenCfg.setTextByKey("top_menu_load_cfg_button");
    }

    private function onOpenCfg(event:MouseEvent):void {
        _openCfgSignal.dispatch();
    }

    public function get openCfgSignal():Signal {
        return _openCfgSignal;
    }

}
}
