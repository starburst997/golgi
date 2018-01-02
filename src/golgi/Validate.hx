package golgi;
import golgi.Error;


/**
  String conversion and validation utilities
 **/
class Validate {
    public static function string(str:String, optional=false, name : String) : String {
        if (str == null){
            if (!optional) throw Missing(name);
            else return null;
        } else {
            return StringTools.urlDecode(str);
        }
    }
    public static function int(str:String, optional=false, name : String) : Int {
        if (str == null || str == ''){
            if (!optional) throw Missing(name);
            return 0;
        } else {
            var res = Std.parseInt(str);
#if (!java && !cpp && !hl)
            if (res == null) throw InvalidValue;
#end
            return res;
        }
    }
    public static function float(str:String, optional=false, name : String) : Float {
        if (str == null || str == ''){
            if (!optional) throw Missing(name);
            else return 0.0;
        } else {
            var res = Std.parseFloat(str);
#if (!java && !cpp && !hl)
            if (res == null) throw InvalidValue;
#end
            return res;
        }
    }
    public static function bool(str:String, optional=false, name : String) : Bool {
        if (str == null || str == ''){
            if (!optional) throw Missing(name);
            return false;
        } else {
            return str != "0" && str != "false";
        }
    }
}

