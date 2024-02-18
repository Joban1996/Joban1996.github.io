/// this enum is to handle the api errors
enum WebError {
  ///internal server error
  INTERNAL_SERVER_ERROR,
  ///already exist
  ALREADY_EXIST,
  ///unauthorized
  UNAUTHORIZED,
  ///invalid json
  INVALID_JSON,
  ///not found
  NOT_FOUND,
  ///unknown
  UNKNOWN,
  ///bad request
  BAD_REQUEST,
  ///forbidden
  FORBIDDEN
}

/// this enum defines the Method of the API call
enum HttpMethod {
  ///http get
  HTTP_GET,
  ///http post
  HTTP_POST,
  ///http put
  HTTP_PUT,
  ///http patch
  HTTP_PATCH }

/// this enum defines that what kind of data is being sent in the API
enum RequestBodyType {
  ///type xx urlencoded
  TYPE_XX_URLENCODED_FORMDATA,
  ///type json
  TYPE_JSON,
  ///type multipart
  TYPE_MULTIPART }

/// this enum defines that what should be sent in the header
enum HeaderType {
  ///type logged in
  TYPE_LOGGED_IN,
  ///type public
  TYPE_PUBLIC,
  ///type public json
  TYPE_PUBLIC_JSON }