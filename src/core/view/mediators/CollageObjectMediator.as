package core.view.mediators {
import com.framework.base.view.mediators.AbstractMediator;

import core.consts.view.components.CollageItemStateConst;
import core.controller.signals.components.AddNewPhotoSignal;
import core.model.interfaces.IImageFactoryService;

import core.model.models.CollageModel;

import core.model.models.GeneralSettingsModel;
import core.view.views.CollageObjectView;
import core.view.views.interfaces.ICollageItem;

import flash.display.DisplayObject;

public class CollageObjectMediator extends AbstractMediator {
    [Inject]
    public var view:CollageObjectView;
    [Inject]
    public var settingsModel:GeneralSettingsModel;
    [Inject]
    public var collageModel:CollageModel;
    [Inject]
    public var factory:IImageFactoryService;
    [Inject]
    public var addNewPhotoSignal:AddNewPhotoSignal;

    private var _items:Object = {};

    public function CollageObjectMediator() {
    }

    override protected function complete():void {
        settingsModel.bindModelPropertyOnMethod(this, "currentList", onLoadNewImagesForList);
        collageModel.bindModelPropertyOnMethod(this, "updated", onCreateCollage);
    }

    private function onCreateCollage(value:Boolean) {
        if (!value) return;
        collageModel.unBindModelPropertyOnMethod(this, "updated", onCreateCollage);
        collageModel.bindModelPropertyOnMethod(this, "updated", onUpdateCollage);
        var count:int = collageModel.colCount;
        var col:Array;
        var viewItem:ICollageItem;
        for (var i:int = 0; i < count; i++) {
            col = collageModel.getCol(i);
            for (var j:int = 0; j < col.length; j++) {
                viewItem = factory.getCollageImageView(col[j]);
                _items[col[j].uid] = viewItem;
                viewItem.changeSignal.add(viewItemAction);
                viewItem.init(col[j].uid, CollageItemStateConst.STATE_NONE);
            }
        }
        view.arrange();
    }

    public function viewItemAction(id:int):void {
        var viewItem:ICollageItem = _items[id];
        switch (viewItem.viewState) {
            case CollageItemStateConst.STATE_NONE:
                    view.addNewImage(DisplayObject(viewItem));
                    viewItem.setState(CollageItemStateConst.STATE_SHOWING);
                    viewItem.show();
                break;
            case CollageItemStateConst.STATE_SHOWING:
                    viewItem.setState(CollageItemStateConst.STATE_SHOWED);
                break;
            case  CollageItemStateConst.STATE_SHOWED:
                    if (!collageModel.updated) return;
                    viewItem.setState(CollageItemStateConst.STATE_HIDING);
                    viewItem.hide();
                    collageModel.updated = false;
                break;
            case  CollageItemStateConst.STATE_HIDING:
                    viewItem.setState(CollageItemStateConst.STATE_DESTROYED);
                    view.removeImageItem(DisplayObject(viewItem));
                    viewItem.destroy();
                    delete _items[id];
                    addNewPhotoSignal.dispatch(id);
                break;
        }
    }

    private function onUpdateCollage(value:Boolean) {
        if (!value) return;
        var count:int = collageModel.colCount;
        var col:Array;
        var viewItem:ICollageItem;
        for (var i:int = 0; i < count; i++) {
            col = collageModel.getCol(i);
            for (var j:int = 0; j < col.length; j++) {
                if (_items.hasOwnProperty(col[j].uid)) {
                    viewItem = _items[col[j].uid];
                    viewItem.moveAndResize(col[j].rect);
                }   else {
                    viewItem = factory.getCollageImageView(col[j]);
                    _items[col[j].uid] = viewItem;
                    viewItem.changeSignal.add(viewItemAction);
                    viewItem.init(col[j].uid, CollageItemStateConst.STATE_NONE);
                }
            }
        }
    }

    private function onLoadNewImagesForList(list:Array) {
        clearView();
    }

    private function clearView():void {
       view.clear();
        collageModel.unBindModelPropertyOnMethod(this, "updated", onUpdateCollage);
        settingsModel.bindModelPropertyOnMethod(this, "currentList", onLoadNewImagesForList);
    }
}
}
