
package {
import flash.display.Sprite;

public class SortArraysClass extends Sprite{
    public function SortArraysClass() {
        trace(sortMethod([4,3,1],[10,5,2,1]));
    }

    private function sortMethod(first:Array, second:Array):Array {
        var res:Array = [];
        var equalMethod:Function;
        if (first[0] < first[first.length - 1]) equalMethod = less
        else equalMethod = more;
        var firstInd:int = 0;
        var secondInd:int = 0;

        while (firstInd < first.length || secondInd < second.length ) {
            if (firstInd < first.length) {
                if (secondInd < second.length) {
                    var equal:int = equalMethod(first[firstInd],second[secondInd]);
                    if (equal > 0) {
                        res.push(second[secondInd]);
                        secondInd++;
                    } else {
                        res.push(first[firstInd]);
                        firstInd++;
                    }
                } else {
                    res.push(first[firstInd]);
                    firstInd++;
                }
            } else {
                if (secondInd < second.length) {
                    res.push(second[secondInd]);
                    secondInd++;
                }
            }
        }

        return res;
    }

    private function less(a:int, b:int):int {
        if (a < b) return -1;
        if (b < a) return 1;
        return 0
    }

    private function more(a:int, b:int):int {
        if (a < b) return 1;
        if (b < a) return -1;
        return 0
    }

}
}
