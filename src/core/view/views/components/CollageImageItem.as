package core.view.views.components {
import com.greensock.TweenLite;

import core.consts.view.components.CollageItemStateConst;
import core.controller.signals.components.CollageItemSignal;
import core.view.views.interfaces.ICollageItem;

import flash.display.Bitmap;

import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.geom.Rectangle;

import org.osflash.signals.Signal;

public class CollageImageItem extends Sprite implements ICollageItem{
    private var _signal:CollageItemSignal = new CollageItemSignal();
    private var _id:int = -1;
    private var _viewState:int = CollageItemStateConst.STATE_NONE;
    private var _image:Bitmap;
    public function CollageImageItem() {
    }

    public function init(id:int, state:int):void {
        _id = id;
        _image.alpha = 0;
        _viewState = state;
        addEventListener(MouseEvent.CLICK, onClick);
        dispatchSignal();
    }

    private function onClick(event:MouseEvent):void {
        dispatchSignal();
    }

    private function dispatchSignal():void {
        _signal.dispatch(_id);
    }

    public function addImage(img:Bitmap):void{
        _image = img;
        addChild(img);
    }

    public function setState(value:int):void {
        _viewState = value;
    }

    public  function moveAndResize(rect:Rectangle):void {
        TweenLite.to(_image, 2, {width: rect.width, height: rect.height})
        TweenLite.to(this, 2, {x:rect.x,  y:rect.y})
    }

    public function show():void {
        TweenLite.to(_image, 2, {onComplete:showFinish, alpha:1})
    }

    private function showFinish():void {
        dispatchSignal();
    }

    public function hide():void {
        TweenLite.to(_image, 2, {onComplete:hideFinish, alpha:0})
    }

    private function hideFinish():void {
        dispatchSignal();
    }

    public function get changeSignal():Signal {
        return _signal;
    }

    public function get id():int {
        return _id;
    }

    public function destroy() {
        _signal = null;
        removeChild(_image);
        _image = null;
    }

    public function get viewState():int {
        return _viewState;
    }
}
}
