class AppError extends Error
  @isa: (obj) ->
    obj instanceof @
  @raise: (params = {}) ->
    err = @create params
    throw err
  @create: (params = {}) ->
    new @ params
  constructor: (params = {}) ->
    super()
    if Error.captureStackTrace
      Error.captureStackTrace @, @constructor
    for key, val of params
      @[key] = val
    if params.hasOwnProperty('error') 
      @name = params.error
    else
      @name = 'AppError'

module.exports = AppError
