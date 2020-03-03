# nvimr


:execute g:_plug_bang:!bash install.sh
/home/rstudio/.local/share/nvim/rplugin.vim:execute g:_plug_bang:!./install --all
/home/rstudio/.fzf.bash
Update /home/rstudio/.bashrc

- startR()

function StartR(whatr)
    let s:wait_nvimcom = 1

    if !g:R_in_buffer
        let g:R_objbr_place = substitute(g:R_objbr_place, 'console', 'script', '')
    endif

    # g:rplugin.tmpdir /tmp/Nvim-R-rstudio
    if !isdirectory(g:rplugin.tmpdir)
        call mkdir(g:rplugin.tmpdir, "p", 0700)
    endif

    " https://github.com/jalvesaq/Nvim-R/issues/157
    if !exists("*FillRLibList")
        exe "source " . substitute(g:rplugin.home, " ", "\\ ", "g") . "/R/functions.vim"
    endif
    # g:rplugin.home /home/rstudio/.local/share/nvim/plugged/Nvim-R/

    let s:has_warning = 0
    if !CheckNvimcomVersion()
        return
    endif

    let s:what_r = a:whatr
    call StartNClientServer('StartR')
endfunction

" echo g:rplugin
" nvimcom_bin_dir = ""
" /usr/local/lib/R/site-library/nvimcom/bin
" /usr/local/lib/R/site-library/nvimcom_home
'compldir': '/home/rstudio/.cache/Nvim-R'

{'debug <- info': {}, 'job <- handlers': {'on <- exit': function('ROnJobExit'), 'on_stdout': function('ROnJobStdout'), 'on_stderr': function('ROnJobStderr')}, 'home': '/home/rstudio/.local/share/nvim/plugged/Nvim-R', 'has_wmctrl': 0, 'uservimfiles': '/home/rstudio/.local/share/nvim/plugged/Nvim-R', 'myport': 0, 'R':'R', 'loaded_libs': ['base', 'stats', 'graphics', 'grDevices', 'utils', 'methods'], 'nvimcom_bin_dir': '', 'nvimcom_port': 0, 'Rcmd': 'R', 'curbuf': 'datasim/R/datasim-package.R', 'is_darwin': 0, 'R_version': '0', 'compldir': '/home/rstudio/.cache/Nvim-R', 'hasmenu': 0, 'rscript_name': 'datasim/R/datasim-package.R', 'tmpdir': '/tmp/Nvim-R-rstudio', 'jobs': {'R': 0, 'Terminal emulator': 0, 'BibComplete': 0, 'ClientServer': 0}, 'lastft': 'r', 'userlogin': 'rstudio', 'debug <- lists': []}

{'debug <- info': {}, 'job <- handlers': {'on <- exit': function('ROnJobExit'), 'on_stdout': function('ROnJobStdout'), 'on_stderr': function('ROnJobStderr')}, 'home': '/home/rstudio/.local/share/nvim/plugged/Nvim-R', 'has_wmctrl': 0, 'uservimfiles': '/home/rstudio/.local/share/nvim/plugged/Nvim-R', 'myport': 0, 'R': 'R', 'loaded_libs': ['base', 'stats', 'graphics', 'grDevices', 'utils', 'methods'], 'nvimcom_bin_dir': '', 'nvimcom_port': 0, 'Rcmd': 'R', 'curbuf': 'datasim/R/datasim-package.R', 'is_darwin': 0, 'R_version': '0', 'compldir': '/home/rstudio/.cache/Nvim-R', 'hasmenu': 0, 'rscript_name': 'datasim/R/datasim-package.R', 'tmpdir': '/tmp/Nvim-R-rstudio', 'jobs': {'R': 0, 'Terminal emulator': 0, 'BibComplete': 0, 'ClientServer': 0}, 'lastft': 'r', 'userlogin': 'rstudio', 'debug_lists': []}


{'debug <- info': {}, 'job <- handlers': {'on <- exit': function('ROnJobExit'), 'on_stdout': function('ROnJobStdout'), 'on_stderr': function('ROnJobStderr')}, 'home': '/home/rstudio/.local/share/nvim/plugged/Nvim-R', 'has_wmctrl': 0, 'uservimfiles': '/home/rstudio/.local/share/nvim/plugged/Nvim-R', 'R_bufname': 'term://.//551:R ', 'myport': '10101', 'R': 'R', 'loaded_libs': ['base', 'stats', 'graphics', 'grDevices', 'utils', 'methods'], 'nvimcom_bin_dir': '/usr/local/lib/R/site-library/nvimcom/bin', 'nvimcom_port': '10001', 'Rcmd': 'R', 'curbuf': 'datasim/R/datasim-package.R', 'is_darwin': 0, 'R_version': '3.6.2', 'compldir': '/home/rstudio/.cache/Nvim-R', 'hasmenu': 0, 'rscript_name': 'datasim/R/datasim-package.R', 'tmpdir': '/tmp/Nvim-R-rstudio', 'jobs': {'R': 13, 'Terminal emulator': 0, 'BibComplete': 0, 'ClientServer': 12}, 'lastft' : 'r', 'userlogin': 'rstudio', 'debug_lists': [], 'r <- args': []}

 


function CheckNvimcomVersion()
    let neednew = 0
    if isdirectory(substitute(s:nvimcom_home, "nvimcom", "", "") . "00LOCK-nvimcom")
        let s:has_warning = 1
        call RWarningMsg('Perhaps you should delete the directory "' .
                    \ substitute(s:nvimcom_home, "nvimcom", "", "") . '00LOCK-nvimcom"')
    endif
    if s:nvimcom_home == ""
        let neednew = 1
    else
"       "/usr/local/lib/R/site-library/nvimcom/DESCRIPTION"
"        filereadable("/usr/local/lib/R/site-library/nvimcom" . "/DESCRIPTION")
        if !filereadable(s:nvimcom_home . "/DESCRIPTION")
            let neednew = 1
        else
            " ndesc = readfile("/usr/local/lib/R/site-library/nvimcom/DESCRIPTION". "/DESCRIPTION")
            let ndesc = readfile(s:nvimcom_home . "/DESCRIPTION")
            let nvers = substitute(ndesc[1], "Version: ", "", "")
            if nvers != s:required_nvimcom
                let neednew = 1
            else
                let rversion = system(g:rplugin.Rcmd . ' --version')
                let rversion = substitute(rversion, '.*R version \(\S\{-}\) .*', '\1', '')
                let g:rplugin.debug_info['R_version'] = rversion
                if g:rplugin.R_version != rversion
                    let neednew = 1
                endif
            endif
        endif
    endif

    " Nvim-R might have been installed as root in a non writable directory.
    " We have to build nvimcom in a writable directory before installing it.
    if neednew
        exe "cd " . substitute(g:rplugin.tmpdir, ' ', '\\ ', 'g')
        if has("win32")
            call SetRHome()
            let cmpldir = substitute(g:rplugin.compldir, '\\', '/', 'g')
        else
            let cmpldir = g:rplugin.compldir
        endif

        " The user libs directory may not exist yet if R was just upgraded
        if exists("g:R_remote_tmpdir")
            let tmpdir = g:R_remote_tmpdir
        else
            let tmpdir = g:rplugin.tmpdir
        endif
        let rcode = [ 'sink("' . tmpdir . '/libpaths")',
                    \ 'cat(.libPaths()[1L],',
                    \ '    unlist(strsplit(Sys.getenv("R_LIBS_USER"), .Platform$path.sep))[1L],',
                    \ '    sep = "\n")',
                    \ 'sink()',
                    \ 'sink("' . cmpldir . '/path_to_nvimcom")',
                    \ 'cat(.libPaths()[1L],',
                    \ '    unlist(strsplit(Sys.getenv("R_LIBS_USER"), .Platform$path.sep))[1L],',
                    \ '    sep = "\n")',
                    \ 'sink()' ]
        call writefile(rcode, g:rplugin.tmpdir . '/nvimcom_path.R')
        let g:rplugin.debug_info['.libPaths()'] = system(g:rplugin.Rcmd . ' --no-restore --no-save --slave -f "' . g:rplugin.tmpdir . '/nvimcom_path.R"')
        if v:shell_error
            let s:has_warning = 1
            call RWarningMsg(g:rplugin.debug_info['.libPaths()'])
            return 0
        endif
        let libpaths = readfile(g:rplugin.tmpdir . "/libpaths")
        call map(libpaths, 'substitute(expand(v:val), "\\", "/", "g")')
        let g:rplugin.debug_info['libPaths'] = libpaths
        if !(isdirectory(libpaths[0]) && IsDirWritable(libpaths[0]) == 2) && !exists("g:R_remote_tmpdir")
            if !isdirectory(libpaths[1])
                let resp = input('"' . libpaths[0] . '" is not writable. Should "' . libpaths[1] . '" be created now? [y/n] ')
                if resp[0] ==? "y"
                    call mkdir(libpaths[1], "p")
                endif
                echo " "
            endif
        endif
        call delete(g:rplugin.tmpdir . '/nvimcom_path.R')
        call delete(g:rplugin.tmpdir . "/libpaths")

        let s:has_warning = 1
        echo "Updating nvimcom... "
        if !exists("g:R_remote_tmpdir")
            let g:rplugin.debug_info['CMD_build'] = system(g:rplugin.Rcmd . ' CMD build "' . g:rplugin.home . '/R/nvimcom"')
        else
            call system('cp -R "' . g:rplugin.home . '/R/nvimcom" .')
            let g:rplugin.debug_info['CMD_build'] = system(g:rplugin.Rcmd . ' CMD build "' . g:R_remote_tmpdir . '/nvimcom"')
            call system('rm -rf "' . g:R_tmpdir . '/nvimcom"')
        endif
        if v:shell_error
            call ShowRSysLog(g:rplugin.debug_info['CMD_build'], "Error_building_nvimcom", "Failed to build nvimcom")
            return 0
        else
            if has("win32")
                call SetRtoolsPath()
                let g:rplugin.debug_info['CMD_INSTALL'] = system(g:rplugin.Rcmd . " CMD INSTALL --no-multiarch nvimcom_" . s:required_nvimcom . ".tar.gz")
                call UnSetRtoolsPath()
            else
                let g:rplugin.debug_info['CMD_INSTALL'] = system(g:rplugin.Rcmd . " CMD INSTALL --no-lock nvimcom_" . s:required_nvimcom . ".tar.gz")
            endif
            if v:shell_error
                if filereadable(expand("~/.R/Makevars"))
                    call ShowRSysLog(g:rplugin.debug_info['CMD_INSTALL'], "Error_installing_nvimcom", "Failed to install nvimcom. Please, check your '~/.R/Makevars'.")
                else
                    call ShowRSysLog(g:rplugin.debug_info['CMD_INSTALL'], "Error_installing_nvimcom", "Failed to install nvimcom")
                endif
                if has("win32")
                    call CheckRtools()
                endif
                call delete("nvimcom_" . s:required_nvimcom . ".tar.gz")
                return 0
            else
                call RSetDefaultPkg()
                echon "Building lists for omni completion... "
                let rdp = $R_DEFAULT_PACKAGES
                if rdp !~ "\<base\>"
                    let rdp .= ",base"
                endif
                let blist = 'nvimcom:::nvim.buildomnils("' . rdp . '")'
                let blist = substitute(blist, ',', '");nvimcom:::nvim.buildomnils("', 'g')
                call writefile(split(blist, ";"), g:rplugin.tmpdir . "/buildomnils.R")
                let g:rplugin.debug_info['Build_Omnils'] = system(g:rplugin.Rcmd .
                            \ ' --quiet --no-save --no-restore -f "' .
                            \ g:rplugin.tmpdir . '/buildomnils.R"')
                if v:shell_error
                    call ShowRSysLog(g:rplugin.debug_info['Build_Omnils'], "Error_building_compl_data", "Failed to build lists")
                    call delete(g:rplugin.tmpdir . "/buildomnils.R")
                    return 0
                endif
                echon "OK!"
                call delete(g:rplugin.tmpdir . "/buildomnils.R")
            endif
        endif
        if has("win32")
            call UnsetRHome()
        endif
        call delete("nvimcom_" . s:required_nvimcom . ".tar.gz")
        silent cd -
    else
        call RSetDefaultPkg()
    endif
    return 1
endfunction

