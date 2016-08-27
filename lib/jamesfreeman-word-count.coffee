JamesfreemanWordCountView = require './jamesfreeman-word-count-view'
{CompositeDisposable} = require 'atom'

module.exports = JamesfreemanWordCount =
  jamesfreemanWordCountView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @jamesfreemanWordCountView = new JamesfreemanWordCountView(state.jamesfreemanWordCountViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @jamesfreemanWordCountView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'jamesfreeman-word-count:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @jamesfreemanWordCountView.destroy()

  serialize: ->
    jamesfreemanWordCountViewState: @jamesfreemanWordCountView.serialize()

  toggle: ->
    console.log('setCount!')
    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      editor = atom.workspace.getActiveTextEditor()
      words = editor.getText().split(/\s+/).length
      @jamesfreemanWordCountView.setCount(words)
      @modalPanel.show()
