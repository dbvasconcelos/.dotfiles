function OpenMarkdownPreview(url)
    exec "Start! brave --new-window " . a:url
endfunction
let g:mkdp_browserfunc = 'OpenMarkdownPreview'
