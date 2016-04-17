package core.model.interfaces {
import core.model.models.component.ImageModel;
import core.view.views.components.CollageImageItem;
import flash.display.Bitmap;

public interface IImageFactoryService {
    function getImageModel(uid:int, img:Bitmap, w:Number):ImageModel;
    function getCollageImageView(model:ImageModel):CollageImageItem;
}
}
