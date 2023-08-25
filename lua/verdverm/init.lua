local function init()
  require 'verdverm.vim'.init()
  require 'verdverm.filetypes'.init()
  require 'verdverm.indent'.init()
  require 'verdverm.packer'.init()
  require 'verdverm.highlight'.init()
  require 'verdverm.cue'.init()
end

return {
  init = init
}
