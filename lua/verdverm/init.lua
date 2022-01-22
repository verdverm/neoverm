local function init()
  require 'verdverm.vim'.init()
  require 'verdverm.packer'.init()
  require 'verdverm.dev'.init()
  require 'verdverm.venn'.init()
end

return {
  init = init,
}
