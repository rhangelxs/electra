//
//  topangadetect.c
//  electra
//
//  Created by CoolStar on 2/12/18.
//  Copyright © 2018 Electra Team. All rights reserved.
//

#include "topangadetect.h"
#include "file_utils.h"
#import <Foundation/Foundation.h>

//THIS DETECTION IS NOT COMPREHENSIVE
//DO NOT TRY MANUALLY REMOVING FILES TO PASS THIS CHECK
//IF NOT ALL OF TOPANGA'S FILES ARE REMOVED, ELECTRA WILL FAIL TO EXTRACT THE BOOTSTRAP
//YOU HAVE BEEN WARNED

bool topangaInstalled(){
    NSMutableArray *bootstrap_files_list = [[NSMutableArray alloc] initWithObjects:
                                            @"/bin/bash",
                                            @"/bin/dd",
                                            @"/bin/ln",
                                            @"/bin/sed",
                                            @"/bin/vdir",
                                            @"/bin/bunzip2",
                                            @"/bin/dir",
                                            @"/bin/ls",
                                            @"/bin/sh",
                                            @"/bin/zcat",
                                            @"/bin/bzcat",
                                            @"/bin/echo",
                                            @"/bin/mkdir",
                                            @"/bin/sleep",
                                            @"/bin/zcmp",
                                            @"/bin/bzip2",
                                            @"/bin/egrep",
                                            @"/bin/mknod",
                                            @"/bin/stty",
                                            @"/bin/zdiff",
                                            @"/bin/bzip2recover",
                                            @"/bin/false",
                                            @"/bin/mktemp",
                                            @"/bin/su",
                                            @"/bin/zegrep",
                                            @"/bin/cat",
                                            @"/bin/fgrep",
                                            @"/bin/mv",
                                            @"/bin/sync",
                                            @"/bin/zfgrep",
                                            @"/bin/chgrp",
                                            @"/bin/grep",
                                            @"/bin/pwd",
                                            @"/bin/tar",
                                            @"/bin/zforce",
                                            @"/bin/chmod",
                                            @"/bin/gunzip",
                                            @"/bin/readlink",
                                            @"/bin/touch",
                                            @"/bin/zgrep",
                                            @"/bin/chown",
                                            @"/bin/gzexe",
                                            @"/bin/rm",
                                            @"/bin/true",
                                            @"/bin/zless",
                                            @"/bin/cp",
                                            @"/bin/gzip",
                                            @"/bin/rmdir",
                                            @"/bin/uname",
                                            @"/bin/zmore",
                                            @"/bin/date",
                                            @"/bin/kill",
                                            @"/bin/run-parts",
                                            @"/bin/uncompress",
                                            @"/bin/znew",
                                            @"/private/var/run/utmp",
                                            @"/sbin/reboot",
                                            @"/sbin/halt",
                                            @"/sbin/dmesg",
                                            @"/sbin/dynamic_pager",
                                            @"/sbin/nologin",
                                            @"/usr/bin/lzmainfo",
                                            @"/usr/bin/iomfsetgamma",
                                            @"/usr/bin/chsh",
                                            @"/usr/bin/gpgv",
                                            @"/usr/bin/toe",
                                            @"/usr/bin/cmp",
                                            @"/usr/bin/locate",
                                            @"/usr/bin/cfversion",
                                            @"/usr/bin/gpg-zip",
                                            @"/usr/bin/dselect",
                                            @"/usr/bin/infotocap",
                                            @"/usr/bin/ncursesw5-config",
                                            @"/usr/bin/dpkg-deb",
                                            @"/usr/bin/diff3",
                                            @"/usr/bin/sw_vers",
                                            @"/usr/bin/gpg",
                                            @"/usr/bin/df",
                                            @"/usr/bin/renice",
                                            @"/usr/bin/captoinfo",
                                            @"/usr/bin/dpkg-name",
                                            @"/usr/bin/bashbug",
                                            @"/usr/bin/dpkg-split",
                                            @"/usr/bin/chfn",
                                            @"/usr/bin/tset",
                                            @"/usr/bin/unlzma",
                                            @"/usr/bin/uicache",
                                            @"/usr/bin/reset",
                                            @"/usr/bin/pagesize",
                                            @"/usr/bin/gpgsplit",
                                            @"/usr/bin/diff",
                                            @"/usr/bin/uiopen",
                                            @"/usr/bin/dpkg-trigger",
                                            @"/usr/bin/updatedb",
                                            @"/usr/bin/ncurses5-config",
                                            @"/usr/bin/script",
                                            @"/usr/bin/ldrestart",
                                            @"/usr/bin/time",
                                            @"/usr/bin/sbdidlaunch",
                                            @"/usr/bin/clear",
                                            @"/usr/bin/tic",
                                            @"/usr/bin/getconf",
                                            @"/usr/bin/lzless",
                                            @"/usr/bin/dpkg-query",
                                            @"/usr/bin/infocmp",
                                            @"/usr/bin/lzcmp",
                                            @"/usr/bin/arch",
                                            @"/usr/bin/xargs",
                                            @"/usr/bin/getty",
                                            @"/usr/bin/lzcat",
                                            @"/usr/bin/ldid",
                                            @"/usr/bin/uiduid",
                                            @"/usr/bin/dirname",
                                            @"/usr/bin/lzdiff",
                                            @"/usr/bin/find",
                                            @"/usr/bin/lzmadec",
                                            @"/usr/bin/lzgrep",
                                            @"/usr/bin/sdiff",
                                            @"/usr/bin/lzmore",
                                            @"/usr/bin/tput",
                                            @"/usr/bin/lzfgrep",
                                            @"/usr/bin/hostinfo",
                                            @"/usr/bin/tar",
                                            @"/usr/bin/lzma",
                                            @"/usr/bin/sbreload",
                                            @"/usr/bin/login",
                                            @"/usr/bin/which",
                                            @"/usr/bin/gssc",
                                            @"/usr/bin/apt-key",
                                            @"/usr/bin/lzegrep",
                                            @"/usr/bin/passwd",
                                            @"/usr/bin/dpkg",
                                            @"/usr/lib/libhistory.5.dylib",
                                            @"/usr/lib/libapt-pkg.dylib.4.6",
                                            @"/usr/lib/libpam.dylib",
                                            @"/usr/lib/libpamc.1.dylib",
                                            @"/usr/lib/libapt-pkg.dylib.4.6.0",
                                            @"/usr/lib/libpanelw.5.dylib",
                                            @"/usr/lib/libhistory.5.2.dylib",
                                            @"/usr/lib/libreadline.6.dylib",
                                            @"/usr/lib/libpanel.dylib",
                                            @"/usr/lib/libapt-inst.dylib.1.1",
                                            @"/usr/lib/libcurses.dylib",
                                            @"/usr/lib/liblzmadec.0.dylib",
                                            @"/usr/lib/libhistory.6.dylib",
                                            @"/usr/lib/libformw.dylib",
                                            @"/usr/lib/libncursesw.dylib",
                                            @"/usr/lib/libapt-inst.dylib",
                                            @"/usr/lib/libncurses.5.dylib",
                                            @"/usr/lib/libapt-pkg.dylib",
                                            @"/usr/lib/libreadline.5.dylib",
                                            @"/usr/lib/libhistory.6.0.dylib",
                                            @"/usr/lib/libform.5.dylib",
                                            @"/usr/lib/libpanelw.dylib",
                                            @"/usr/lib/libmenuw.dylib",
                                            @"/usr/lib/libform.dylib",
                                            @"/usr/lib/terminfo",
                                            @"/usr/lib/libpam.1.0.dylib",
                                            @"/usr/lib/libmenu.5.dylib",
                                            @"/usr/lib/libpatcyh.dylib",
                                            @"/usr/lib/libreadline.6.0.dylib",
                                            @"/usr/lib/liblzmadec.dylib",
                                            @"/usr/lib/libncurses.dylib",
                                            @"/usr/lib/libhistory.dylib",
                                            @"/usr/lib/libpamc.dylib",
                                            @"/usr/lib/libformw.5.dylib",
                                            @"/usr/lib/libapt-inst.dylib.1.1.0",
                                            @"/usr/lib/libpanel.5.dylib",
                                            @"/usr/lib/liblzmadec.0.0.0.dylib",
                                            @"/usr/lib/_ncurses",
                                            @"/usr/lib/libpam_misc.1.dylib",
                                            @"/usr/lib/libreadline.5.2.dylib",
                                            @"/usr/lib/libpam_misc.dylib",
                                            @"/usr/lib/libreadline.dylib",
                                            @"/usr/lib/libmenuw.5.dylib",
                                            @"/usr/lib/libpam.1.dylib",
                                            @"/usr/lib/libmenu.dylib",
                                            @"/usr/lib/liblzmadec.la",
                                            @"/usr/lib/libncursesw.5.dylib",
                                            @"/usr/libexec/frcode",
                                            @"/usr/libexec/bigram",
                                            @"/usr/libexec/code",
                                            @"/usr/libexec/reload",
                                            @"/usr/libexec/rmt",
                                            @"/usr/sbin/accton",
                                            @"/usr/sbin/vifs",
                                            @"/usr/sbin/ac",
                                            @"/usr/sbin/update",
                                            @"/usr/sbin/pwd_mkdb",
                                            @"/usr/sbin/sysctl",
                                            @"/usr/sbin/zdump",
                                            @"/usr/sbin/startupfiletool",
                                            @"/usr/sbin/iostat",
                                            @"/usr/sbin/mkfile",
                                            @"/usr/sbin/zic",
                                            @"/usr/sbin/vipw",
                                            @"/usr/share/dict",
                                            @"/usr/bin/gtar",
                                            @"/usr/bin/dselect",
                                            @"/usr/bin/cycc",
                                            @"/usr/bin/dpkg-statoverride",
                                            @"/usr/bin/dpkg-deb",
                                            @"/usr/bin/dpkg-divert",
                                            @"/usr/bin/cynject",
                                            @"/usr/bin/update-alternatives",
                                            @"/usr/bin/dpkg-split",
                                            @"/usr/bin/uicache",
                                            @"/usr/bin/dpkg-trigger",
                                            @"/usr/bin/dpkg-maintscript-helper",
                                            @"/usr/bin/env",
                                            @"/usr/bin/gnutar",
                                            @"/usr/bin/cycript",
                                            @"/usr/bin/dpkg-query",
                                            @"/usr/bin/apt",
                                            @"/usr/bin/apt-get",
                                            @"/usr/bin/dpkg",
                                            @"/usr/libexec/MSUnrestrictProcess",
                                            @"/usr/libexec/substrate",
                                            @"/usr/sbin/start-stop-daemon",
                                            @"/usr/lib/libcycript.dylib",
                                            @"/usr/lib/libcycript.jar",
                                            @"/usr/lib/libapt-inst.dylib",
                                            @"/usr/lib/libapt-pkg.dylib",
                                            @"/usr/lib/libdpkg.a",
                                            @"/usr/lib/libcrypto.1.0.0.dylib",
                                            @"/usr/lib/libssl.1.0.0.dylib",
                                            @"/usr/lib/libcycript.db",
                                            @"/usr/lib/libcurl.4.dylib",
                                            @"/usr/lib/libcycript.0.dylib",
                                            @"/usr/lib/libcycript.cy",
                                            @"/usr/lib/libdpkg.la",
                                            @"/usr/lib/libsubstrate.0.dylib",
                                            @"/bin/cat",
                                            @"/bin/pwd",
                                            @"/bin/sed",
                                            @"/bin/sleep",
                                            @"/bin/stty",
                                            @"/bin/date",
                                            @"/bin/bzip2_64",
                                            @"/bin/kill",
                                            @"/bin/sh",
                                            @"/bin/dd",
                                            @"/bin/mkdir",
                                            @"/bin/hostname",
                                            @"/bin/rmdir",
                                            @"/bin/mv",
                                            @"/bin/ln",
                                            @"/bin/ls",
                                            @"/bin/cp",
                                            @"/bin/chown",
                                            @"/bin/chmod",
                                            @"/bin/rm",
                                            @"/bin/bzip2",
                                            @"/Library/test_inject_springboard.cy",
                                            @"/usr/local/lib/libluajit.a",
                                            nil];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    for (NSString *fileName in bootstrap_files_list){
        if ([fileManager fileExistsAtPath:fileName]){
            NSLog(@"Found uncleanable file %@", fileName);
            return true;
        }
    }
    return false;
}
