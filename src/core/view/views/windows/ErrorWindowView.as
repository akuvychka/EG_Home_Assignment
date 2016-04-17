package core.view.views.windows {
import com.framework.base.view.views.AbstractModalView;
import com.framework.base.view.views.components.ExtendedLabel;
import com.framework.utils.LocalizationUtils;
import core.consts.LayersNameConst;


public class ErrorWindowView extends AbstractModalView {
    public var desc_txt:ExtendedLabel;

    public function ErrorWindowView() {
        linkage = "error_window_mc";
        layerName = LayersNameConst.MODAL_LAYER;
        isFader = true;
    }

    override protected function complete():void {
        close_btn.label_txt.value_txt.text = LocalizationUtils.getTextByKey("ok");
    }

    public function setErrorKey(value:String):void {
        desc_txt.value_txt.text = LocalizationUtils.getTextByKey(value);
    }
}
}
