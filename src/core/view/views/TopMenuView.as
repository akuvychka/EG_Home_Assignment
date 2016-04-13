package core.view.views {
import com.framework.base.view.views.AbstractView;

import core.consts.LayersNameConst;

public class TopMenuView extends AbstractView {
    public function TopMenuView() {
        linkage = "GuiTop_mc";
        layerName = LayersNameConst.MENU_LAYER;
    }
}
}
