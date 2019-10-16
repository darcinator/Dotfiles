" === Denite shorcuts === "
"   ;         - Browser currently open buffers
"   <leader>t - Browse list of files in current directory
"   <leader>g - Search current directory for occurences of given term and
"   close window if no results
"   <leader>j - Search current directory for occurences of word under cursor
"
nmap ; :Denite buffer -split=floating<CR>
nmap <leader>t :Denite file/rec -split=floating<CR>
nnoremap <leader>g :<C-u>Denite grep:. -no-empty -split=floating<CR>
nnoremap <leader>j :<C-u>DeniteCursorWord grep:. -split=floatgin<CR>

" === Denite setup ==="
try
  	" Define mappings
	autocmd FileType denite call s:denite_my_settings()
	function! s:denite_my_settings() abort
	  nnoremap <silent><buffer><expr> <CR>
	  \ denite#do_map('do_action')
	  nnoremap <silent><buffer><expr> d
	  \ denite#do_map('do_action', 'delete')
	  nnoremap <silent><buffer><expr> p
	  \ denite#do_map('do_action', 'preview')
	  nnoremap <silent><buffer><expr> q
	  \ denite#do_map('quit')
	  nnoremap <silent><buffer><expr> i
	  \ denite#do_map('open_filter_buffer')
	  nnoremap <silent><buffer><expr> <Space>
	  \ denite#do_map('toggle_select').'j'
	endfunction

  autocmd FileType denite-filter call s:denite_filter_my_settings()
	function! s:denite_filter_my_settings() abort
	  imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
	endfunction

	" Change file/rec command.
	call denite#custom#var('file/rec', 'command',
	\ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

" Custom options for ag
"   --vimgrep:  Show results with every match on it's own line
"   --hidden:   Search hidden directories and files
"   --heading:  Show the file name above clusters of matches from each file
" call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading'])

" Recommended defaults for ag via Denite docs
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Remove date from buffer list
" call denite#custom#var('buffer', 'date_format', '')

" Open file commands
" call denite#custom#map('insert,normal', \"<C-t>", '<denite:do_action:tabopen>')
" call denite#custom#map('insert,normal', \"<C-v>", '<denite:do_action:vsplit>')
" call denite#custom#map('insert,normal', \"<C-h>", '<denite:do_action:split>')

" Custom options for Denite
"   auto_resize             - Auto resize the Denite window height automatically.
"   prompt                  - Customize denite prompt
"   direction               - Specify Denite window direction as directly below current pane
"   winminheight            - Specify min height for Denite window
"   highlight_mode_insert   - Specify h1-CursorLine in insert mode
"   prompt_highlight        - Specify color of prompt
"   highlight_matched_char  - Matched characters highlight
"   highlight_matched_range - matched range highlight
" let s:denite_options = {'default' : {
" \ 'auto_resize': 1,
" \ 'prompt': 'λ:',
" \ 'direction': 'rightbelow',
" \ 'winminheight': '10',
" \ 'highlight_mode_insert': 'Visual',
" \ 'highlight_mode_normal': 'Visual',
" \ 'prompt_highlight': 'Function',
" \ 'highlight_matched_char': 'Function',
" \ 'highlight_matched_range': 'Normal'
" \ }}

" Loop through denite options and enable them
" function! s:profile(opts) abort
  " for l:fname in keys(a:opts)
    " for l:dopt in keys(a:opts[l:fname])
      " call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
    " endfor
  " endfor
" endfunction

" call s:profile(s:denite_options)
" catch
  " echo 'Denite not installed. It should work after running :PlugInstall'
endtry
