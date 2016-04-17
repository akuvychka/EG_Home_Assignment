package core.model.service {
import com.framework.base.model.services.AbstractService;

import core.model.interfaces.IImageFactoryService;
import core.model.models.component.ImageModel;
import core.view.views.components.CollageImageItem;

import flash.display.Bitmap;

public class ImageFactoryService extends AbstractService implements IImageFactoryService{
    public function ImageFactoryService() {
        super();
    }

    public function getImageModel(uid:int, img:Bitmap, w:Number):ImageModel {
        var res:ImageModel = new ImageModel(uid);
        res.image = img;
        res.scale = w / res.rect.width;
        return res;
    }

    public function getCollageImageView(model:ImageModel):CollageImageItem {
        var res:CollageImageItem = new CollageImageItem();
        var newImg:Bitmap = model.image;
        newImg.width = model.rect.width;
        newImg.height = model.rect.height;
        res.x = model.rect.x;
        res.y = model.rect.y;
        res.addImage(newImg);
        return res;
    }
}
}
