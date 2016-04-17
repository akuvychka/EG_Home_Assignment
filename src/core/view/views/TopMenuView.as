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
    private var _generateSignal:Signal = new Signal();
    private var _loadFilesSignal:Signal = new Signal();

    public function TopMenuView() {
        linkage = "gui_top_mc";
        layerName = LayersNameConst.MENU_LAYER;
    }

    override protected function complete():void {
        btnOpenCfg.addEventListener(MouseEvent.CLICK, onOpenCfg);
        btnGenerate.addEventListener(MouseEvent.CLICK, onGenerateClick);
        btnChooseFiles.addEventListener(MouseEvent.CLICK, onLoadFiles);
        btnGenerate.label_txt.value_txt.text = LocalizationUtils.getTextByKey("top_menu_generate_button");
        btnOpenCfg.label_txt.value_txt.text = LocalizationUtils.getTextByKey("top_menu_load_cfg_button");
        btnChooseFiles.label_txt.value_txt.text = LocalizationUtils.getTextByKey("top_menu_load_files_button");
    }

    private function onGenerateClick(event:MouseEvent):void {
        _generateSignal.dispatch();
    }

    private function onOpenCfg(event:MouseEvent):void {
        _openCfgSignal.dispatch();
    }

    private function onLoadFiles(event:MouseEvent):void {
        _loadFilesSignal.dispatch();
    }

    public function get openCfgSignal():Signal {
        return _openCfgSignal;
    }

    public function get loadFilesSignal():Signal {
        return _loadFilesSignal;
    }

    public function get generateSignal():Signal {
        return _generateSignal;
    }
}
}
