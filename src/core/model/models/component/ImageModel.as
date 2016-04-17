package core.model.models.component {
import com.framework.base.model.models.AbstractModel;
import flash.display.Bitmap;
import flash.geom.Rectangle;

public class ImageModel extends AbstractModel {
    private var _rect:Rectangle;
    private var _image:Bitmap;
    public var col:int;
    private var _uid:int;

    public function ImageModel(uid:int) {
        _rect = new Rectangle();
        _uid = uid;
    }

    public function set image(img:Bitmap):void {
        _image = img;
        _rect.width = _image.width;
        _rect.height = _image.height;
    }

    public function set scale(value:Number):void{
        _rect.width = _rect.width * value;
        _rect.height = _rect.height * value;
    }

    public function moveTo(x:Number, y:Number):void {
        _rect.x = x;
        _rect.y = y;
    }

    public function moveToX(x:Number):void {
        _rect.x = x;
    }

    public function moveToY(y:Number):void {
        _rect.y = y;
    }

    public function get rect():Rectangle {
        return _rect;
    }

    public function get image():Bitmap {
        return _image;
    }

    public function destroy():void {
        _rect = null;
        _image = null;
    }

    public function get uid():int {
        return _uid;
    }
}
}
