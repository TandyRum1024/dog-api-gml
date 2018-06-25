///json_prettydump(text)
/*
    Pretty-ify the RAW json thingo
    Basically shoves newline into each commas.
*/

var pretty = argument0;
var idx    = 0;
var char   = '';
var skip   = 0;

while (idx++ < string_length(pretty))
{
    char = string_char_at(pretty, idx);
    
    // child
    if (char == '[')
    {
        skip++;
    }
    else if (char == ']')
    {
        skip--;
    }
    
    if (skip == 0)
    {
        // newline
        if (char == ',')
        {
            pretty = string_insert('#', pretty, idx + 1);
            idx++; // skip newly added newline
        }
        
        // hashtag swag
        if (char == '#')
        {
            pretty = string_insert('\', pretty, idx);
            idx++; // skip newly added escapeer
        }
    }
}

return pretty;
