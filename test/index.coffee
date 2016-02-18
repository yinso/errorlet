AppError = require '../src/index'
{ assert } = require 'chai'

describe 'app error test', ->

  it 'can create app error', ->
    err = new AppError { foo: 1, bar: 2 }

  it 'can change name', ->
    err = new AppError { error: 'unauthorized', message: 'You are not authorized' }
    assert.equal err.name, 'unauthorized'

  it 'can ensure right stack level', ->
    foo = (context = foo) ->
      new AppError { error: 'top-level', message: 'should not see foo or bar in stack' }, context
    bar = () ->
      foo bar
    err = bar()
    stack = err.stack.split('\n')
    assert.notOk stack[1].match /at foo/
    assert.notOk stack[1].match /at bar/
    assert.ok stack[1].match /at Context/

  it 'can raise error', ->
    foo = (context = foo) ->
      AppError.raise { error: 'top-level', message: 'should not see foo or bar in stack' }, context
    bar = () ->
      foo bar
    try
      bar()
    catch err
      stack = err.stack.split('\n')
      assert.notOk stack[1].match /at foo/
      assert.notOk stack[1].match /at bar/
      assert.ok stack[1].match /at Context/

