package core.model.service {
import com.framework.base.model.services.AbstractService;

import core.controller.signals.errors.ShowErrorSignal;

import core.model.interfaces.ICollageService;
import core.model.interfaces.IImageFactoryService;
import core.model.models.CollageModel;
import core.model.models.GeneralSettingsModel;
import core.model.models.component.ImageModel;

import flash.display.Bitmap;

public class CollageService extends AbstractService implements ICollageService{
    [Inject]
    public var factory:IImageFactoryService;
    [Inject]
    public var collageModel:CollageModel;
    [Inject]
    public var generalSettings:GeneralSettingsModel;
    [Inject]
    public var errorSignal:ShowErrorSignal;

    public function CollageService() {
    }

    public function generate():void {
        collageModel.updated = false;
        collageModel.size = generalSettings.collageSize;
        var notCompleted:Boolean = true;
        var col:Array;
        while (notCompleted) {
            col = createRol();
            if (col.length > 0){
                if (col[0].rect.width < (1.5 * collageModel.getFreeWidth)) {
                    collageModel.addColl(col);
                } else {
                    notCompleted = false;
                    returnBack(col);
                }
            } else {
                notCompleted = false;
            }
        }
        collageModel.updated = true;
    }

    private function createRol():Array {
        var col:Array  = [];
        var colHeight:Number = 0;
        var item:ImageModel;
        var img:Bitmap;
        var itemCount:int = randomCountItems;
        for (var i:int = 0; i <itemCount; i++) {
            img = collageModel.nextImage;
            if (img){
                item = factory.getImageModel(collageModel.nextIndex, img, collageModel.getFreeWidth);
                colHeight = colHeight + item.rect.height;
                item.col = collageModel.colCount;
                col.push(item);
            } else break;
        }
        col = scaleAndMove(col, colHeight);
        return col;
    }

    private function scaleAndMove(col:Array, scaleToHeight:Number):Array{
        var scaleValue:Number = generalSettings.collageSize.y / scaleToHeight;
        var heightPos:Number = 0;
        var item:ImageModel;
        for (var i = 0; i <col.length; i++) {
            item = col[i];
            item.scale = scaleValue;
            item.moveToY(heightPos);
            heightPos = heightPos + item.rect.height;
        }
        return col;
    }

    private function returnBack(col:Array):void {
        var item:ImageModel;
        while (col.length > 0){
            item = col.pop();
            collageModel.addImage(item.image);
            item.destroy();
            item = null;
        }
    }

    private function get randomCountItems():int {
        var count:int = -1;
        while (count < generalSettings.minRows){
            count = Math.round(Math.random() * generalSettings.maxRows);
        }
        return count;
    }

    public function changePhoto(id:int):void {
        var imgModel:ImageModel = collageModel.getItemByID(id) as ImageModel;
        var col:Array = collageModel.getCol(imgModel.col);
        var img:Bitmap = collageModel.nextImage;
        if (img) {
            var newModel:ImageModel = factory.getImageModel(collageModel.nextIndex, img, imgModel.rect.width);
            newModel.col = imgModel.col;
            col[col.indexOf(imgModel)] = newModel;
            var colHeight:Number = 0;
            for (var i:int =  0; i < col.length; i++) {
                colHeight = colHeight + col[i].rect.height;
            }
            col = scaleAndMove(col, colHeight)
            collageModel.swapCol(imgModel.col, col);
            collageModel.addByID(newModel.uid, newModel);
            collageModel.updated = true;
        } else {
            errorSignal.dispatch("last_photo");
        }
    }

}
}
