/// _ctb_build_word_list( text )
/*
    This script parses the text and builds a list of words and tags.
    You normally should never have to call this script.
*/

// Parse text for words. Tags count as words. This is used for text-wrapping.
var W = ds_list_create();
var P=1;
var C,w="";
var isTag = false;

for( P=1; P<=string_length(argument[0]); P++ ) {
    C = string_char_at( argument[0],P );

    if( isTag && C=="]" ) {

        if( string_length( w ) > 2 && string_pos( ":",w ) != 0 && string_pos( ":",w ) != string_length( w ) ) {
            var l,r;
            var nw = string_delete( w,1,1 );
            var nwp = string_pos( ":", nw );
            l = string_copy( nw, 1, nwp-1 );
            r = string_copy( nw, nwp+1, string_length( nw )-nwp );
            if( tag_on ) {
                switch( string_lower( l ) )
                {
                    case "c":
                    case "color":
                        ds_list_add( W,_ctb_create_tag( "color", CTB_Colors[? r] ) );
                        w = "";
                    break;
                    
                    case "f":
                    case "font":
                        ds_list_add( W,_ctb_create_tag( "font", CTB_Fonts[? r] ) );
                        w = "";
                    break;
                    
                    case "tag":
                        if( string_lower( r ) == "off" ) tag_on = false;
                        w = "";
                    break;
                    
                    default:
                        if( ds_map_exists( CTB_Commands, string_lower( l ) ) ) {
                            ds_list_add( W,_ctb_create_tag( string_lower( l ), r ) );
                            w = "";
                        }
                        else {
                            w += C;
                        }
                    break;
                }
            }
            else {
                if( string_lower( l ) == "tag" ) {
                    if( string_lower( r ) == "on" ) tag_on = true;
                    w = "";
                }
                else w += C;
            }
        }
        else if( string_length( w ) >= 2 && tag_on ) {
            switch( string_lower( string_delete( w,1,1 ) ) ) {
                case "n":
                case "newline":
                    ds_list_add( W,_ctb_create_tag( "newline", "" ) );
                    w = "";
                break;
                
                case "#":
                    ds_list_add( W,"\#" );
                    w = "";
                break;
                
                default:
                    w += C;
                break
            }
        }
        else w += C;
        
        isTag = false;
    }
    else if( C!=" " && C!="[" ) {
        if( C=="#" && !isTag ) {        
            if( w != "" ) {
                ds_list_add( W,w );
                w = "";
            }
            ds_list_add( W,_ctb_create_tag( "newline","" ) );
        }
        else {
            w += C;
        }
    }
    else if( isTag && C==" " ) {
        isTag = false;
        ds_list_add( W,w );
        ds_list_add( W," " );
        w = "";
    }
    else if( !isTag && C=="[" ) {
     
        if( w != "" ) {
            ds_list_add( W,w );
            w = "";
        }
        w+="[";
        isTag = true;
     
    }
    else {
     
        ds_list_add( W,w );
        ds_list_add( W," " );
        w = "";
    }
}

if( w != "" ) ds_list_add( W,w );

return W;
