package core.view.views.interfaces {
import flash.geom.Rectangle;

import org.osflash.signals.Signal;

public interface ICollageItem {
    function init(id:int, state:int):void;
    function show():void;
    function hide():void;
    function setState(value:int):void;
    function moveAndResize(rect:Rectangle):void
    function get viewState():int;
    function get changeSignal():Signal;
    function get id():int;
    function destroy();
}
}
