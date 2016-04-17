package core.model.models {
import com.framework.base.model.models.AbstractModel;

public class ErrorModel extends AbstractModel{

    public function set errorDecr(value:String):void {
        set("errorDecr", value);
    }

    public function get errorDecr():String {
        return  String(get("errorDecr"));
    }
}
}
