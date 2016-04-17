package {
import core.context.MainContext;

import flash.display.Sprite;
import flash.system.Security;
import flash.text.TextField;

[SWF(backgroundColor="#FFFFFF", frameRate="30", width="760", height="800")]
public class EGHAMain extends Sprite {
    public function EGHAMain() {
        if (Security.sandboxType != Security.LOCAL_TRUSTED) {
            showSandboxType();
            return;
        }
        var clientContext:MainContext = new MainContext();
        clientContext.contextView = this;
        moveToCenter();
    }

    private function moveToCenter():void {
        this.x = this.x + 380;
        this.y = this.y + 400;
    }

    private function showSandboxType():void {
        //TODO: Show local error
    }
}
}
