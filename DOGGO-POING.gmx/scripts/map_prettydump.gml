///map_prettydump( map )
/*
    Dump map from JSON
*/

var map    = argument0;
var pretty = "";
var key    = ds_map_find_first(map);
var dsType = 0;
var obj    = -1;

while (key != undefined)
{
    //show_debug_message("KEY : " + string(key));

    obj = map[? key];
    
    // append KEY
    pretty += '"' + string(key) + '"';
    
    // check type
    if (ds_exists(obj, ds_type_list))
        dsType = 1;
    else if (ds_exists(obj, ds_type_map))
        dsType = 2;
    else
        dsType = 3; // nothing, A value.
    
    switch (dsType)
    {
        // list
        case 1:
            var listSize = ds_list_size(obj);
            
            //show_debug_message("GET LIST : " + string(listSize));
            pretty += "[ ";
            
            if (listSize == 0)
                pretty += " NADA ";
            else
            {
                for (var i=0; i<listSize; i++)
                {
                    pretty += string(obj[| i]) + ", ";
                }
            }
            
            pretty += " ]";
            break;
        
        // map
        case 2:
            //show_debug_message("GET MAP");
            pretty += "{ ";
            map_prettydump( obj );
            pretty += " }";
            break;
        
        // value
        case 3:
            //show_debug_message("GET MAP");
            pretty += ": " + string(obj);
            break;
        
        default:
            //show_debug_message("WRONG");
            break;
    }
    
    // nextline
    pretty += '#';
    key = ds_map_find_next(map, key);
}

return pretty;
