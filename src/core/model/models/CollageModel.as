package core.model.models {
import com.framework.base.model.models.AbstractModel;
import flash.display.Bitmap;
import flash.geom.Point;

public class CollageModel extends AbstractModel {
    private var _images:Array = [];
    private var _size:Point;
    private var _currentWidth:Number = 0;
    private var _cols:Object = {};
    private var _allItemsByID:Object = {};
    private var _colCount:int = 0;
    private var _ind:int = -1;

    public function addImage(img:Bitmap):void {
        _images.push(img);
    }

    public function get nextImage():Bitmap {
        return _images.pop();
    }

    public function get nextIndex():int {
        return _ind++;
    }

    public function reset():void {
        _images = [];
        _cols = {};
        _colCount = 0;
        _currentWidth = 0;
    }

    public function get getFreeWidth():Number {
       return _size.x - _currentWidth;
    }

    public function addColl(value:Array):void {
        for (var i:int = 0; i < value.length; i++){
            value[i].moveToX(_currentWidth);
            addByID(value[i].uid, value[i]);
        }
        _currentWidth = _currentWidth + value[0].rect.width;
        _cols[_colCount] = value;
        _colCount++;
    }

    public function addByID(id:int, value:AbstractModel){
        _allItemsByID[id] = value;
    }

    public function removeByID(id:int):void {
       delete _allItemsByID[id];
    }

    public function getItemByID(id:int):AbstractModel {
        return _allItemsByID[id]
    }

    public function getCol(ind:int):Array {
        return _cols[ind];
    }

    public function swapCol(ind:int, value:Array):void {
        _cols[ind] = value;
        reCalc();
    }

    private function reCalc():void {
        _currentWidth = 0;
        var col:Array;
        for (var i:int = 0; i <_colCount; i++) {
            col = _cols[i];
            for (var j:int = 0; j < col.length; j++) {
                col[j].moveToX(_currentWidth);
            }
            _currentWidth = _currentWidth + col[0].rect.width;
        }
    }

    public function set size(value:Point):void {
        _size = value;
    }

    public function get colCount():int {
        return _colCount;
    }

    public function set updated(value:Boolean):void {
        set("updated", value);
    }

    public function get updated():Boolean {
        return  Boolean(get("updated"));
    }
}
}
