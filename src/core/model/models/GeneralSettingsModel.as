package core.model.models {
import com.framework.base.model.models.AbstractModel;
import core.model.interfaces.ISettings;
import flash.geom.Point;

public class GeneralSettingsModel extends AbstractModel implements ISettings {
    public function set collagePhotoCount(value:int):void {
        set("collagePhotoCount", value);
    }

    public function set collageSize(value:Point):void {
        set("collagePhotoCount", value);
    }

    public function get collagePhotoCount():int {
        return  int(get("collagePhotoCount"));
    }

    public function get collageSize():Point {
        return Point(get("collagePhotoCount"));
    }
}
}
