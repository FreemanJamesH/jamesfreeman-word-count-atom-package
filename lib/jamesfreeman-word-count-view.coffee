module.exports =
class JamesfreemanWordCountView
  constructor: (serializedState) ->
    # Create root element
    @element = document.createElement('div')
    @element.classList.add('jamesfreeman-word-count')

    # Create message element
    message = document.createElement('div')
    message.textContent = "The JamesfreemanWordCount package is Alive! It's ALIVE!"
    message.classList.add('message')
    @element.appendChild(message)

  setCount: (count) ->
    displayText = "There are #{count} words."
    @element.children[0].textContent = displayText

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element
