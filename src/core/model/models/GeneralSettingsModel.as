package core.model.models {
import com.framework.base.model.models.AbstractModel;
import flash.geom.Point;

public class GeneralSettingsModel extends AbstractModel {
    public function set minRows(value:int):void {
        set("minRows", value);
    }

    public function set maxRows(value:int):void {
        set("maxRows", value);
    }

    public function set collageSize(value:Point):void {
        set("collageSize", value);
    }

    public function set currentList(value:Array):void {
        set("currentList", value);
    }

    public function get minRows():int {
        return  int(get("minRows"));
    }

    public function get maxRows():int {
        return  int(get("maxRows"));
    }

    public function get collageSize():Point {
        return Point(get("collageSize"));
    }

    public function get currentList():Array {
        return  Array(get("currentList"))[0];
    }
}
}
