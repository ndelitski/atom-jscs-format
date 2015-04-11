{CommandRunner} = require './runner'

activate = ->
  console.log 'activate jscs-formatter'
  atom.commands.add 'atom-workspace', 'jscs-format:format', toggle
  return

toggle = ->
  editor = atom.workspace.getActivePaneItem()
  if editor and editor.getPath
    filePath = editor.getPath()
    if filePath
      editor.save()
      commandRunner = new CommandRunner("jscs --fix #{filePath}", (c, out) -> console.log(out))
      commandRunner.runCommand()

module.exports =
  activate: activate
