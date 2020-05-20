
#print_spec() 

function print_spec { 

    $spec_mesg = '@
    
    Spec:= ScrapLogger  
    Args:= 
        -Mode := <watch|log> 
            log:= <Apache|General|App_Def> 
                if App_Def is swtiched, then specify the Applications Log Message / Facility / ID tag in a .properties / yaml file (the path of which should be specified in at the commandline, 
                otherwise its assumed to be located in pwd) 

                General looks like the following:= 
                INFO
                WARN
                ERROR
        
        -logFormat:=  
            The default is a simple logfile, which is just <DATE>, <CHANGETYPE>, <PATH> 
            Other formats can be:= <JSON|CommonLogFormat (Apahce)|WINSTON|formatID> 
                if formatID is specified, it can be read from a .properties / yaml file (identical condition is above). 
    
        -logFileSystem:= specifies the filesystem in which to store logfiles. the default is ~/Logs. 
            #TODO: add support for Log output to socket, pipe, RPC and database 
        
        -logFile Specifies the log file to use. if there is no log file specified, it will resort to log-<DATE>.log 
            #TODO: add file extension detection logic 

        -git <yes|no> := Specifies wheter to use git when saving and tracking logs. the Default is <YES>, but it can be turned off. 
        
        -msg <[STRING]> := Specifes the default message for commit. However, there may be times when you need several default messages. 
        
        -mesgFile <[FILE]> := Specifies the file to source for automated git messaging. Depending on the coniditon, Scrapper will select the message, based on the log changetype/tag 
            it will look for the message file in pwd, unless otherwise specified. 

        -config <[FILE]> := Specifies the config file to source from. This way, the options can be changed out as needed 
            BEST PRACTICE: STORE THE GODDAMN CONFIG FILES IN ITS OWN REPO!!! 
    
    @'
}
