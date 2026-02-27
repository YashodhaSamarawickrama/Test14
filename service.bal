import ballerina/http;
import ballerina/io;

# A service representing a network-accessible API
# bound to port `9090`.
configurable int configValue = 100;

service / on new http:Listener(9090) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get greeting(string name) returns string|error {
        // Send a response back to the caller.
        if name is "" {
            return error("name should not be empty!");
        }
        io:println("Config value: " + configValue.toString());    
        return "Hello, " + name;
    }
}
