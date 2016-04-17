package core.view.views {
import com.framework.base.view.views.AbstractView;
import core.consts.LayersNameConst;

import flash.display.DisplayObject;
import flash.display.Sprite;


public class CollageObjectView extends AbstractView {
    private var _itemContainer:Sprite = new Sprite();
    public function CollageObjectView() {
        layerName = LayersNameConst.MAIN_LAYER;
        addChild(_itemContainer);
    }

    public function addNewImage(item:DisplayObject):void {
        _itemContainer.addChild(item);
    }

    public function removeImageItem(item:DisplayObject):void {
        if (_itemContainer == item.parent){
            _itemContainer.removeChild(item);
        }
    }

    public function arrange():void {
        _itemContainer.x = -_itemContainer.width * 0.5;
        _itemContainer.y = -_itemContainer.height * 0.5;

    }

    public function clear():void {

    }
}
}
