--$Name:The Barbarian and the Subterranean Caves (Demo)$
--$Name(ru):Варвар и подземные пещеры (Демо)$
--$Version:1.85$
--$Author:NLB project$
instead_version "2.3.0"

--package.cpath = "./?.so"
require "luapassing"

require "prefs"
require "xact"
require "hideinv"
--require "para"
require "dash"
require "quotes" 
require "theme" 
require "timer" 
require 'modules/nlb'
require 'modules/fonts'
require 'modules/paginator'
require 'modules/vn'
require 'modules/big_pig'
require 'modules/gobj'
game.codepage="UTF-8";
game.forcedsc=true;
stead.scene_delim = '^';

f1 = font('fonts/STEINEMU.ttf', 32);
fend = font('fonts/STEINEMU.ttf', 96);
function pname(n, c)
    return function()
        pn(img 'blank:8x1',f1:txt(n, c, 1))
    end
end
paginator.delim = '\n[ \t]*\n'
function exec(s)
    p('$'..s:gsub("\n", "^")..'$^^')
end
function init()
    statsAPI.init();
    vn:turnoff();
    dofile("theme_vn.lua");
    vn:scene(nil);
    vn.fading = 8
    _export_lang = 'en';
    _syscall_showmenubtn:act();
    format.quotes = false;
    if not prefs.achievements then
        prefs.achievements = {};
    end
    if not prefs.achievements['MAIN_MENU'] then prefs.achievements['MAIN_MENU'] = 0; end;
    prefs:store();
    nlb:resendAchievements(statsAPI);
end

_version_obj = gobj {
    nam = "version_obj",
    system_type = true,
    pic = "gfx/version.png",
    txtfn = function(s) return { [1] = {["text"] = '1.85', ["color"] = 'white' } }; end,
    eff = "left-top@0,0",
    iarm = {[0] = {0, 16}}

}
-- nlblogo_in
v_d4b18a63_4da0_4b5b_ab8a_3da3f6dc16bf = gobj {
    var { tag = ''; container = function() return v_da36b7de_b2fd_46c9_a9cf_5e253cc445dc; end; },
    nlbid = 'd4b18a63-4da0-4b5b-ab8a-3da3f6dc16bf',
    deref = function(s) return stead.deref(v_d4b18a63_4da0_4b5b_ab8a_3da3f6dc16bf); end,
    nam = "nlblogo_in",
    eff = "fadein-middle-middle@0,0",
    maxStep = 48,
    startFrame = 0,
    curStep = 0,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
    end,
    pic = function(s)
        if (true) then
            return 'images/nlblogo.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_nlblogo_in = v_d4b18a63_4da0_4b5b_ab8a_3da3f6dc16bf
-- f2Obj2
v_b04274ed_f7c0_4766_8373_cb6e32a90f09 = gobj {
looped = true,
    var { tag = ''; container = function() return v_b320c822_0a3f_4f93_95a1_64010499d9e5; end; },
    nlbid = 'b04274ed-f7c0-4766-8373-cb6e32a90f09',
    deref = function(s) return stead.deref(v_b04274ed_f7c0_4766_8373_cb6e32a90f09); end,
    nam = "f2Obj2",
    eff = "overlap-left-top@1448,232",
    maxStep = 41,
    startFrame = 26,
    curStep = 26,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
    end,
    pic = function(s)
        if (true) then
            return 'images/f2.jpg';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_f2Obj2 = v_b04274ed_f7c0_4766_8373_cb6e32a90f09
-- intro_over
v_fc7398cd_1fda_4fee_afcd_c3de200ce0d5 = gobj {
    var { tag = ''; container = function() return nil; end; },
    nlbid = 'fc7398cd-1fda-4fee-afcd-c3de200ce0d5',
    deref = function(s) return stead.deref(v_fc7398cd_1fda_4fee_afcd_c3de200ce0d5); end,
    nam = "intro_over",
    eff = "left-top@0,0",
    arm = { [0] = { 0,0 } },
    morphout = function(s) return v_cb415758_d349_4058_a86c_c79d096eb1b0:deref(); end,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
    end,
    actt = function(s)
        return "Introduction";
    end,
    actp = function(s)
        nlb:curloc().lasttext = s.actt(s); p(nlb:curloc().lasttext); nlb:curloc().wastext = true;
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
_intro = true;
    end,
};

_intro_over = v_fc7398cd_1fda_4fee_afcd_c3de200ce0d5
-- options_over
v_d2e8da9b_22d2_471d_b397_855150805da5 = gobj {
noactredraw = true,
    var { tag = ''; container = function() return nil; end; },
    nlbid = 'd2e8da9b-22d2-471d-b397-855150805da5',
    deref = function(s) return stead.deref(v_d2e8da9b_22d2_471d_b397_855150805da5); end,
    nam = "options_over",
    eff = "left-top@0,0",
    arm = { [0] = { 632,759 } },
    morphout = function(s) return v_6c04ae4b_bd83_4cd4_9389_ef77463e2e2c:deref(); end,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
    end,
    actt = function(s)
        return "Options";
    end,
    actp = function(s)
        nlb:curloc().lasttext = s.actt(s); p(nlb:curloc().lasttext); nlb:curloc().wastext = true;
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
nlb:actf(_syscall_menu);
    end,
    pic = function(s)
        if (true) then
            return 'images/options.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_options_over = v_d2e8da9b_22d2_471d_b397_855150805da5
-- f1Obj2
v_72d29302_468d_481b_966f_57ade070b4d7 = gobj {
looped = true,
    var { tag = ''; container = function() return v_b320c822_0a3f_4f93_95a1_64010499d9e5; end; },
    nlbid = '72d29302-468d-481b-966f-57ade070b4d7',
    deref = function(s) return stead.deref(v_72d29302_468d_481b_966f_57ade070b4d7); end,
    nam = "f1Obj2",
    eff = "overlap-left-top@337,224",
    maxStep = 41,
    startFrame = 26,
    curStep = 26,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
    end,
    pic = function(s)
        if (true) then
            return 'images/f1.jpg';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_f1Obj2 = v_72d29302_468d_481b_966f_57ade070b4d7
-- load_over
v_6e34bc21_c7a1_4558_b584_a17e973e9a03 = gobj {
noactredraw = true,
    var { tag = ''; container = function() return nil; end; },
    nlbid = '6e34bc21-c7a1-4558-b584-a17e973e9a03',
    deref = function(s) return stead.deref(v_6e34bc21_c7a1_4558_b584_a17e973e9a03); end,
    nam = "load_over",
    eff = "left-top@0,0",
    arm = { [0] = { 671,447 } },
    morphout = function(s) return v_ca044320_5938_4f5f_87c4_fc48d98e817c:deref(); end,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
    end,
    actt = function(s)
        return "Load";
    end,
    actp = function(s)
        nlb:curloc().lasttext = s.actt(s); p(nlb:curloc().lasttext); nlb:curloc().wastext = true;
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
nlb:actf(_syscall_menu_load);
    end,
    pic = function(s)
        if (true) then
            return 'images/load_game.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_load_over = v_6e34bc21_c7a1_4558_b584_a17e973e9a03
-- f1Obj1
v_0cbe433c_43cb_41db_8c36_8a5644991011 = gobj {
    var { tag = ''; container = function() return v_1b52b2b2_21f4_44de_9432_b1bbccbb4fd8; end; },
    nlbid = '0cbe433c-43cb-41db-8c36-8a5644991011',
    deref = function(s) return stead.deref(v_0cbe433c_43cb_41db_8c36_8a5644991011); end,
    nam = "f1Obj1",
    eff = "overlap-left-top@337,224",
    maxStep = 25,
    startFrame = 0,
    curStep = 2,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
    end,
    pic = function(s)
        if (true) then
            return 'images/f1.jpg';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_f1Obj1 = v_0cbe433c_43cb_41db_8c36_8a5644991011
-- start_out_en
v_2d91035b_94ef_434e_8455_5e87542cfb84 = gobj {
    var { tag = ''; container = function() return v_8dd51e43_a96e_420e_8ef6_4e3cc7a20526; end; },
    nlbid = '2d91035b-94ef-434e-8455-5e87542cfb84',
    deref = function(s) return stead.deref(v_2d91035b_94ef_434e_8455_5e87542cfb84); end,
    nam = "start_out_en",
    eff = "left-top@0,0",
    arm = { [0] = { 657,122 } },
    morphover = function(s) return v_6b89c837_70dc_4bc0_848b_890f324615ea:deref(); end,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
    end,
    pic = function(s)
        if (true) then
            return 'images/english_version_t.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_start_out_en = v_2d91035b_94ef_434e_8455_5e87542cfb84
-- exit_over
v_00979fcc_8975_4638_8455_52be35de8d1c = gobj {
noactredraw = true,
    var { tag = ''; container = function() return nil; end; },
    nlbid = '00979fcc-8975-4638-8455-52be35de8d1c',
    deref = function(s) return stead.deref(v_00979fcc_8975_4638_8455_52be35de8d1c); end,
    nam = "exit_over",
    eff = "left-top@0,0",
    arm = { [0] = { 634,902 } },
    morphout = function(s) return v_688cd7db_c39b_4391_a375_f4ad476d8200:deref(); end,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
    end,
    actt = function(s)
        return "Exit";
    end,
    actp = function(s)
        nlb:curloc().lasttext = s.actt(s); p(nlb:curloc().lasttext); nlb:curloc().wastext = true;
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
nlb:actf(_syscall_menu_exit);
    end,
    pic = function(s)
        if (true) then
            return 'images/exit.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_exit_over = v_00979fcc_8975_4638_8455_52be35de8d1c
-- options_out
v_6c04ae4b_bd83_4cd4_9389_ef77463e2e2c = gobj {
noactredraw = true,
    var { tag = ''; container = function() return v_8dd51e43_a96e_420e_8ef6_4e3cc7a20526; end; },
    nlbid = '6c04ae4b-bd83-4cd4-9389-ef77463e2e2c',
    deref = function(s) return stead.deref(v_6c04ae4b_bd83_4cd4_9389_ef77463e2e2c); end,
    nam = "options_out",
    eff = "left-top@0,0",
    arm = { [0] = { 632,759 } },
    morphover = function(s) return v_d2e8da9b_22d2_471d_b397_855150805da5:deref(); end,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
    end,
    pic = function(s)
        if (true) then
            return 'images/options_t.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_options_out = v_6c04ae4b_bd83_4cd4_9389_ef77463e2e2c
-- start_out_ru
v_04902a04_faa5_4310_b524_eec328bb3ae1 = gobj {
    var { tag = ''; container = function() return v_8dd51e43_a96e_420e_8ef6_4e3cc7a20526; end; },
    nlbid = '04902a04-faa5-4310-b524-eec328bb3ae1',
    deref = function(s) return stead.deref(v_04902a04_faa5_4310_b524_eec328bb3ae1); end,
    nam = "start_out_ru",
    eff = "left-top@0,0",
    arm = { [0] = { 670,284 } },
    morphover = function(s) return v_829ee1a3_e7a5_4be2_a7e2_45a068481223:deref(); end,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
    end,
    pic = function(s)
        if (true) then
            return 'images/russian_version_t.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_start_out_ru = v_04902a04_faa5_4310_b524_eec328bb3ae1
-- credits_over
v_15db188a_5b42_4f27_aefd_575ac87e8658 = gobj {
    var { tag = ''; container = function() return nil; end; },
    nlbid = '15db188a-5b42-4f27-aefd-575ac87e8658',
    deref = function(s) return stead.deref(v_15db188a_5b42_4f27_aefd_575ac87e8658); end,
    nam = "credits_over",
    eff = "left-top@0,0",
    arm = { [0] = { 657,601 } },
    morphout = function(s) return v_883adf2d_7498_43c1_b82b_a880c0e891c1:deref(); end,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
    end,
    actt = function(s)
        return "Credits";
    end,
    actp = function(s)
        nlb:curloc().lasttext = s.actt(s); p(nlb:curloc().lasttext); nlb:curloc().wastext = true;
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
_credits = true;
    end,
    pic = function(s)
        if (true) then
            return 'images/credits.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_credits_over = v_15db188a_5b42_4f27_aefd_575ac87e8658
-- presents_out
v_3978214c_072b_44e9_92e9_a9749927b2c0 = gobj {
    var { tag = ''; container = function() return v_a135a9ec_65be_4774_b2c5_14e06026385c; end; },
    nlbid = '3978214c-072b-44e9-92e9-a9749927b2c0',
    deref = function(s) return stead.deref(v_3978214c_072b_44e9_92e9_a9749927b2c0); end,
    nam = "presents_out",
    eff = "fadeout-middle-middle@0,0",
    maxStep = 48,
    startFrame = 0,
    curStep = 0,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
    end,
    pic = function(s)
        if (true) then
            return 'images/presents.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_presents_out = v_3978214c_072b_44e9_92e9_a9749927b2c0
-- nlblogo_out
v_60e27336_12ef_4702_b1cb_d9b822a36fcc = gobj {
    var { tag = ''; container = function() return v_5bd37bb6_9454_4388_b33d_291d4ccd20ce; end; },
    nlbid = '60e27336-12ef-4702-b1cb-d9b822a36fcc',
    deref = function(s) return stead.deref(v_60e27336_12ef_4702_b1cb_d9b822a36fcc); end,
    nam = "nlblogo_out",
    eff = "fadeout-middle-middle@0,0",
    maxStep = 48,
    startFrame = 0,
    curStep = 0,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
    end,
    pic = function(s)
        if (true) then
            return 'images/nlblogo.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_nlblogo_out = v_60e27336_12ef_4702_b1cb_d9b822a36fcc
-- exit_out
v_688cd7db_c39b_4391_a375_f4ad476d8200 = gobj {
noactredraw = true,
    var { tag = ''; container = function() return v_8dd51e43_a96e_420e_8ef6_4e3cc7a20526; end; },
    nlbid = '688cd7db-c39b-4391-a375-f4ad476d8200',
    deref = function(s) return stead.deref(v_688cd7db_c39b_4391_a375_f4ad476d8200); end,
    nam = "exit_out",
    eff = "left-top@0,0",
    arm = { [0] = { 634,902 } },
    morphover = function(s) return v_00979fcc_8975_4638_8455_52be35de8d1c:deref(); end,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
    end,
    pic = function(s)
        if (true) then
            return 'images/exit_t.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_exit_out = v_688cd7db_c39b_4391_a375_f4ad476d8200
-- f2Obj1
v_3a5869f7_34dc_4f09_ab19_1c6f35d3ea9d = gobj {
    var { tag = ''; container = function() return v_1b52b2b2_21f4_44de_9432_b1bbccbb4fd8; end; },
    nlbid = '3a5869f7-34dc-4f09-ab19-1c6f35d3ea9d',
    deref = function(s) return stead.deref(v_3a5869f7_34dc_4f09_ab19_1c6f35d3ea9d); end,
    nam = "f2Obj1",
    eff = "overlap-left-top@1448,232",
    maxStep = 25,
    startFrame = 0,
    curStep = 2,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
    end,
    pic = function(s)
        if (true) then
            return 'images/f2.jpg';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_f2Obj1 = v_3a5869f7_34dc_4f09_ab19_1c6f35d3ea9d
-- load_out
v_ca044320_5938_4f5f_87c4_fc48d98e817c = gobj {
noactredraw = true,
    var { tag = ''; container = function() return v_8dd51e43_a96e_420e_8ef6_4e3cc7a20526; end; },
    nlbid = 'ca044320-5938-4f5f-87c4-fc48d98e817c',
    deref = function(s) return stead.deref(v_ca044320_5938_4f5f_87c4_fc48d98e817c); end,
    nam = "load_out",
    eff = "left-top@0,0",
    arm = { [0] = { 671,447 } },
    morphover = function(s) return v_6e34bc21_c7a1_4558_b584_a17e973e9a03:deref(); end,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
    end,
    pic = function(s)
        if (true) then
            return 'images/load_game_t.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_load_out = v_ca044320_5938_4f5f_87c4_fc48d98e817c
-- start_over_ru
v_829ee1a3_e7a5_4be2_a7e2_45a068481223 = gobj {
    var { tag = ''; container = function() return nil; end; },
    nlbid = '829ee1a3-e7a5-4be2-a7e2-45a068481223',
    deref = function(s) return stead.deref(v_829ee1a3_e7a5_4be2_a7e2_45a068481223); end,
    nam = "start_over_ru",
    eff = "left-top@0,0",
    arm = { [0] = { 670,284 } },
    morphout = function(s) return v_04902a04_faa5_4310_b524_eec328bb3ae1:deref(); end,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
    end,
    actt = function(s)
        return "Russian version";
    end,
    actp = function(s)
        nlb:curloc().lasttext = s.actt(s); p(nlb:curloc().lasttext); nlb:curloc().wastext = true;
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
nlb:actf(_syscall_showmenubtn);
nlb:actf(_syscall_startru);
    end,
    pic = function(s)
        if (true) then
            return 'images/russian_version.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_start_over_ru = v_829ee1a3_e7a5_4be2_a7e2_45a068481223
-- start_over_en
v_6b89c837_70dc_4bc0_848b_890f324615ea = gobj {
    var { tag = ''; container = function() return nil; end; },
    nlbid = '6b89c837-70dc-4bc0-848b-890f324615ea',
    deref = function(s) return stead.deref(v_6b89c837_70dc_4bc0_848b_890f324615ea); end,
    nam = "start_over_en",
    eff = "left-top@0,0",
    arm = { [0] = { 657,122 } },
    morphout = function(s) return v_2d91035b_94ef_434e_8455_5e87542cfb84:deref(); end,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
    end,
    actt = function(s)
        return "English version";
    end,
    actp = function(s)
        nlb:curloc().lasttext = s.actt(s); p(nlb:curloc().lasttext); nlb:curloc().wastext = true;
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
nlb:actf(_syscall_showmenubtn);
nlb:actf(_syscall_starten);
    end,
    pic = function(s)
        if (true) then
            return 'images/english_version.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_start_over_en = v_6b89c837_70dc_4bc0_848b_890f324615ea
-- credits_out
v_883adf2d_7498_43c1_b82b_a880c0e891c1 = gobj {
    var { tag = ''; container = function() return v_8dd51e43_a96e_420e_8ef6_4e3cc7a20526; end; },
    nlbid = '883adf2d-7498-43c1-b82b-a880c0e891c1',
    deref = function(s) return stead.deref(v_883adf2d_7498_43c1_b82b_a880c0e891c1); end,
    nam = "credits_out",
    eff = "left-top@0,0",
    arm = { [0] = { 657,601 } },
    morphover = function(s) return v_15db188a_5b42_4f27_aefd_575ac87e8658:deref(); end,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
    end,
    pic = function(s)
        if (true) then
            return 'images/credits_t.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_credits_out = v_883adf2d_7498_43c1_b82b_a880c0e891c1
-- skipObj
v_04d2f69b_7b46_45ab_854d_dbb230454344 = gobj {
preserved = true,
    var { tag = ''; container = function() return v_da36b7de_b2fd_46c9_a9cf_5e253cc445dc; end; },
    nlbid = '04d2f69b-7b46-45ab-854d-dbb230454344',
    actonkey = function(s, down, key)
        if down then
            s:actf();
        end
        return down;
    end,
    deref = function(s) return stead.deref(v_04d2f69b_7b46_45ab_854d_dbb230454344); end,
    nam = "skipObj",
    eff = "right-top@0",
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    alive = function(s)
        return (_intro);
    end,
    life = function(s)
        if not s:alive() then
            nlb._filter[stead.deref(s)] = true;
            s:disable();
        end;
    end,
    revive = function(s)
        if (_intro) then
            nlb._filter[stead.deref(s)] = false;
            s:enable();
        end;
    end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
_intro =  false ;
nlb:nlbwalk(nil, v_8dd51e43_a96e_420e_8ef6_4e3cc7a20526);
    end,
    pic = function(s)
        if (true) then
            return 'images/skip.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

lifeon('v_04d2f69b_7b46_45ab_854d_dbb230454344');
_skipObj = v_04d2f69b_7b46_45ab_854d_dbb230454344
-- presents_in
v_0b66da23_7a3d_4bd9_a9a6_b3bfd8e0c58b = gobj {
    var { tag = ''; container = function() return v_fbf46ec7_9f51_49a7_8d60_d351d70a2ac1; end; },
    nlbid = '0b66da23-7a3d-4bd9-a9a6-b3bfd8e0c58b',
    deref = function(s) return stead.deref(v_0b66da23_7a3d_4bd9_a9a6_b3bfd8e0c58b); end,
    nam = "presents_in",
    eff = "fadein-middle-middle@0,0",
    maxStep = 48,
    startFrame = 0,
    curStep = 0,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
    end,
    pic = function(s)
        if (true) then
            return 'images/presents.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_presents_in = v_0b66da23_7a3d_4bd9_a9a6_b3bfd8e0c58b
-- version_holder_obj
v_ed0a660b_54c9_4cea_857f_3aa4adfef92d = gobj {
    var { tag = ''; container = function() return v_8dd51e43_a96e_420e_8ef6_4e3cc7a20526; end; },
    nlbid = 'ed0a660b-54c9-4cea-857f-3aa4adfef92d',
    deref = function(s) return stead.deref(v_ed0a660b_54c9_4cea_857f_3aa4adfef92d); end,
    nam = "version_holder_obj",
    eff = "left-bottom@0,0",
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
    end,
    pic = function(s)
        if (true) then
            return 'images/version_holder.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_version_holder_obj = v_ed0a660b_54c9_4cea_857f_3aa4adfef92d
-- intro_out
v_cb415758_d349_4058_a86c_c79d096eb1b0 = gobj {
    var { tag = ''; container = function() return nil; end; },
    nlbid = 'cb415758-d349-4058-a86c-c79d096eb1b0',
    deref = function(s) return stead.deref(v_cb415758_d349_4058_a86c_c79d096eb1b0); end,
    nam = "intro_out",
    eff = "left-top@0,0",
    arm = { [0] = { 0,0 } },
    morphover = function(s) return v_fc7398cd_1fda_4fee_afcd_c3de200ce0d5:deref(); end,
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
        return true;
    end,
    actt = function(s)
        return "";
    end,
    actp = function(s)
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
    end,
};

_intro_out = v_cb415758_d349_4058_a86c_c79d096eb1b0
-- 
main, v_489e8c3a_519a_4587_bedd_1d291036b82a = room { nam = "main", enter = function(s) nlb:nlbwalk(s, v_489e8c3a_519a_4587_bedd_1d291036b82a); end }, room {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    nosave = true,
    notes = "",
    bgimg = function(s)
    end,
    pic = function(s)
    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
    end,
    xdsc = function(s)
        p "^";
    end,
    autos = function(s)
        nlb:revive();
        if ((_seen_main_menu ~= nil) and (_seen_main_menu <= 0)) then                 nlb:nlbwalk(s, v_da36b7de_b2fd_46c9_a9cf_5e253cc445dc); 
        return false;
 end;
        if ((_seen_main_menu ~= nil) and (_seen_main_menu > 0)) then                 nlb:nlbwalk(s, v_8dd51e43_a96e_420e_8ef6_4e3cc7a20526); 
        return false;
 end;
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_489e8c3a_519a_4587_bedd_1d291036b82a_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    enter = function(s, f)
        lifeon(s);
        s.lasttext = nil;
        s.wastext = false;
        dofile('theme_standard.lua');
        if not (f.autowired) then
            nlb:addf(v_ed0a660b_54c9_4cea_857f_3aa4adfef92d, _version_obj, false);
_seen_main_menu = nlb:getAchievement(statsAPI, 'MAIN_MENU');
        end;
        s.snd(s);
        s.add_gobj(s);
        s.autos(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
        lifeoff(s);
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
        s.nextsnd(s);
    end,
    sndout = function(s) end,
};

-- 
v_5bd37bb6_9454_4388_b33d_291d4ccd20ce = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    nosave = true,
    notes = "",
    bgimg = function(s)

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
    end,
    autos = function(s)
        nlb:revive();
        if (true) then         nlb:nlbwalk(s, v_fbf46ec7_9f51_49a7_8d60_d351d70a2ac1); 

        return false;
 end;
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_5bd37bb6_9454_4388_b33d_291d4ccd20ce_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    enter = function(s, f)
        lifeon(s);
        s.lasttext = nil;
        s.wastext = false;
        dofile('theme_vn.lua');
        if not (f.autowired) then
        end;
        s.snd(s);
        vn:request_full_clear();
        vn:lock_direct();
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if v_60e27336_12ef_4702_b1cb_d9b822a36fcc.preload then
            geomFuncNeedToCall = false;
            v_60e27336_12ef_4702_b1cb_d9b822a36fcc:preload(s);
        else
            vn:gshow(v_60e27336_12ef_4702_b1cb_d9b822a36fcc);
        end
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
        lifeoff(s);
        vn:request_full_clear();
        vn:unlock_direct();
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
    end,
    sndout = function(s) end,
};

-- Credits
v_90240f88_4462_4121_9c71_51ce70710e68 = room {
    nam = "Credits",
    notes = "Credits",
    bgimg = function(s)
        if (true) then
            return 'images/333f31.jpg';
        end
    end,
    pic = function(s)
    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
p("Text: NLB project team^"..
"^"..
"Special thanks for English translation proofreading: Christine Ewert, Vervang^"..
"^"..
"Introduction musical theme: Anton Brezhnev \91 Tony Cyclone(Z) \93^"..
"^"..
"Music: NLB project team^"..
"^"..
"Paintings:^"..
"Jan Davidsz de Heem (1606-1684)^"..
"Fruit Still-Life with a Wine Glass, 1640-1645^"..
"Fruit and Seafood^"..
"^"..
"Illustrations: NLB project team^"..
"^"..
"Textures: http://www.textures.com^"..
"^"..
"3D models:^"..
"^"..
"rattle snake -- by seiyoushimi from http://www.blendswap.com/blends/view/66360^"..
"gorilla -- by StuartD from http://www.blendswap.com/blends/view/17397^"..
"dinosaur -- by utopianqn from http://www.blendswap.com/blends/view/15216^"..
"camel -- by BigMouse from http://www.blendswap.com/blends/view/67360^"..
"skeleton -- by feelgoodcomics from http://www.blendswap.com/blends/view/703");
    end,
    xdsc = function(s)
        p "^";
        p("{v_95122742_d4bf_4c2c_85cd_e0c93cfbba43|Back}^");
    end,
    autos = function(s)
        nlb:revive();
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_90240f88_4462_4121_9c71_51ce70710e68_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    enter = function(s, f)
        lifeon(s);
        s.lasttext = nil;
        s.wastext = false;
        dofile('theme_standard.lua');
        if not (f.autowired) then
_credits =  false ;
        end;
        s.snd(s);
        s.add_gobj(s);
        s.autos(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        theme.gfx.bg(bg_img);
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
        lifeoff(s);
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
        s.nextsnd(s);
    end,
    sndout = function(s) end,
    obj = { 
        xdsc(),
        xact(
            'v_95122742_d4bf_4c2c_85cd_e0c93cfbba43',
            function(s) 
                --Back
                nlb:nlbwalk(s, v_8dd51e43_a96e_420e_8ef6_4e3cc7a20526); 
            end
        ),

    },
};

-- 
v_b320c822_0a3f_4f93_95a1_64010499d9e5 = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    nosave = true,
    notes = "",
    bgimg = function(s)
        if (true) then
            return 'images/intro.0000.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
    end,
    autos = function(s)
        nlb:revive();
        if (true) then     _intro =  false ;
        nlb:nlbwalk(s, v_8dd51e43_a96e_420e_8ef6_4e3cc7a20526); 

        return false;
 end;
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_b320c822_0a3f_4f93_95a1_64010499d9e5_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    enter = function(s, f)
        lifeon(s);
        nlbticks = stead.ticks();
        s.lasttext = nil;
        s.wastext = false;
        dofile('theme_vn.lua');
        if not (f.autowired) then
        end;
        s.snd(s);
        vn:request_full_clear();
        vn:lock_direct();
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if v_72d29302_468d_481b_966f_57ade070b4d7.preload then
            geomFuncNeedToCall = false;
            v_72d29302_468d_481b_966f_57ade070b4d7:preload(s);
        else
            vn:gshow(v_72d29302_468d_481b_966f_57ade070b4d7);
        end
        if v_b04274ed_f7c0_4766_8373_cb6e32a90f09.preload then
            geomFuncNeedToCall = false;
            v_b04274ed_f7c0_4766_8373_cb6e32a90f09:preload(s);
        else
            vn:gshow(v_b04274ed_f7c0_4766_8373_cb6e32a90f09);
        end
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
        lifeoff(s);
        vn:request_full_clear();
        vn:unlock_direct();
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
    end,
    sndout = function(s) end,
};

-- 
v_a135a9ec_65be_4774_b2c5_14e06026385c = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    nosave = true,
    notes = "",
    bgimg = function(s)

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
    end,
    autos = function(s)
        nlb:revive();
        if (true) then         nlb:nlbwalk(s, v_1b52b2b2_21f4_44de_9432_b1bbccbb4fd8); 

        return false;
 end;
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_a135a9ec_65be_4774_b2c5_14e06026385c_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    enter = function(s, f)
        lifeon(s);
        s.lasttext = nil;
        s.wastext = false;
        dofile('theme_vn.lua');
        if not (f.autowired) then
        end;
        s.snd(s);
        vn:request_full_clear();
        vn:lock_direct();
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if v_3978214c_072b_44e9_92e9_a9749927b2c0.preload then
            geomFuncNeedToCall = false;
            v_3978214c_072b_44e9_92e9_a9749927b2c0:preload(s);
        else
            vn:gshow(v_3978214c_072b_44e9_92e9_a9749927b2c0);
        end
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
        lifeoff(s);
        vn:request_full_clear();
        vn:unlock_direct();
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
    end,
    sndout = function(s) end,
};

-- 
v_fbf46ec7_9f51_49a7_8d60_d351d70a2ac1 = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    nosave = true,
    notes = "",
    bgimg = function(s)

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
    end,
    autos = function(s)
        nlb:revive();
        if (true) then         nlb:nlbwalk(s, v_a135a9ec_65be_4774_b2c5_14e06026385c); 

        return false;
 end;
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_fbf46ec7_9f51_49a7_8d60_d351d70a2ac1_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    enter = function(s, f)
        lifeon(s);
        s.lasttext = nil;
        s.wastext = false;
        dofile('theme_vn.lua');
        if not (f.autowired) then
        end;
        s.snd(s);
        vn:request_full_clear();
        vn:lock_direct();
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if v_0b66da23_7a3d_4bd9_a9a6_b3bfd8e0c58b.preload then
            geomFuncNeedToCall = false;
            v_0b66da23_7a3d_4bd9_a9a6_b3bfd8e0c58b:preload(s);
        else
            vn:gshow(v_0b66da23_7a3d_4bd9_a9a6_b3bfd8e0c58b);
        end
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
        lifeoff(s);
        vn:request_full_clear();
        vn:unlock_direct();
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
    end,
    sndout = function(s) end,
};

-- 
v_8dd51e43_a96e_420e_8ef6_4e3cc7a20526 = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    notes = "",
    bgimg = function(s)
        if (true) then
            return 'images/menu_new.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
    end,
    autos = function(s)
        nlb:revive();
        if ((_credits)) then         nlb:nlbwalk(s, v_90240f88_4462_4121_9c71_51ce70710e68); 

        return false;
 end;
        if ((_intro)) then         nlb:nlbwalk(s, v_da36b7de_b2fd_46c9_a9cf_5e253cc445dc); 

        return false;
 end;
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_8dd51e43_a96e_420e_8ef6_4e3cc7a20526_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    enter = function(s, f)
        lifeon(s);
        s.lasttext = nil;
        s.wastext = false;
        dofile('theme_vn.lua');
        if not (f.autowired) then
_intro =  false ;
nlb:setAchievement(statsAPI, 'MAIN_MENU');
        end;
        s.snd(s);
        vn:request_full_clear();
        vn:lock_direct();
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if v_2d91035b_94ef_434e_8455_5e87542cfb84.preload then
            geomFuncNeedToCall = false;
            v_2d91035b_94ef_434e_8455_5e87542cfb84:preload(s);
        else
            vn:gshow(v_2d91035b_94ef_434e_8455_5e87542cfb84);
        end
        if v_04902a04_faa5_4310_b524_eec328bb3ae1.preload then
            geomFuncNeedToCall = false;
            v_04902a04_faa5_4310_b524_eec328bb3ae1:preload(s);
        else
            vn:gshow(v_04902a04_faa5_4310_b524_eec328bb3ae1);
        end
        if v_6c04ae4b_bd83_4cd4_9389_ef77463e2e2c.preload then
            geomFuncNeedToCall = false;
            v_6c04ae4b_bd83_4cd4_9389_ef77463e2e2c:preload(s);
        else
            vn:gshow(v_6c04ae4b_bd83_4cd4_9389_ef77463e2e2c);
        end
        if v_883adf2d_7498_43c1_b82b_a880c0e891c1.preload then
            geomFuncNeedToCall = false;
            v_883adf2d_7498_43c1_b82b_a880c0e891c1:preload(s);
        else
            vn:gshow(v_883adf2d_7498_43c1_b82b_a880c0e891c1);
        end
        if v_ed0a660b_54c9_4cea_857f_3aa4adfef92d.preload then
            geomFuncNeedToCall = false;
            v_ed0a660b_54c9_4cea_857f_3aa4adfef92d:preload(s);
        else
            vn:gshow(v_ed0a660b_54c9_4cea_857f_3aa4adfef92d);
        end
        if v_ca044320_5938_4f5f_87c4_fc48d98e817c.preload then
            geomFuncNeedToCall = false;
            v_ca044320_5938_4f5f_87c4_fc48d98e817c:preload(s);
        else
            vn:gshow(v_ca044320_5938_4f5f_87c4_fc48d98e817c);
        end
        if v_688cd7db_c39b_4391_a375_f4ad476d8200.preload then
            geomFuncNeedToCall = false;
            v_688cd7db_c39b_4391_a375_f4ad476d8200:preload(s);
        else
            vn:gshow(v_688cd7db_c39b_4391_a375_f4ad476d8200);
        end
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
        lifeoff(s);
        vn:request_full_clear();
        vn:unlock_direct();
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/svf.ogg', 0);
    end,
    sndout = function(s) end,
};

-- 
v_1b52b2b2_21f4_44de_9432_b1bbccbb4fd8 = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    nosave = true,
    notes = "",
    bgimg = function(s)
        if (true) then
            return 'images/intro.0000.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
    end,
    autos = function(s)
        nlb:revive();
        if (true) then         nlb:nlbwalk(s, v_b320c822_0a3f_4f93_95a1_64010499d9e5); 

        return false;
 end;
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_1b52b2b2_21f4_44de_9432_b1bbccbb4fd8_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    enter = function(s, f)
        lifeon(s);
        nlbticks = stead.ticks();
        s.lasttext = nil;
        s.wastext = false;
        dofile('theme_vn.lua');
        if not (f.autowired) then
        end;
        s.snd(s);
        vn:request_full_clear();
        vn:lock_direct();
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if v_0cbe433c_43cb_41db_8c36_8a5644991011.preload then
            geomFuncNeedToCall = false;
            v_0cbe433c_43cb_41db_8c36_8a5644991011:preload(s);
        else
            vn:gshow(v_0cbe433c_43cb_41db_8c36_8a5644991011);
        end
        if v_3a5869f7_34dc_4f09_ab19_1c6f35d3ea9d.preload then
            geomFuncNeedToCall = false;
            v_3a5869f7_34dc_4f09_ab19_1c6f35d3ea9d:preload(s);
        else
            vn:gshow(v_3a5869f7_34dc_4f09_ab19_1c6f35d3ea9d);
        end
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
        lifeoff(s);
        vn:request_full_clear();
        vn:unlock_direct();
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
    end,
    sndout = function(s) end,
};

-- 
v_da36b7de_b2fd_46c9_a9cf_5e253cc445dc = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    nosave = true,
    notes = "",
    bgimg = function(s)

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
    end,
    autos = function(s)
        nlb:revive();
        if (true) then         nlb:nlbwalk(s, v_5bd37bb6_9454_4388_b33d_291d4ccd20ce); 

        return false;
 end;
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_da36b7de_b2fd_46c9_a9cf_5e253cc445dc_snds');
        if sndfile ~= nil then
            s.sndout(s);
            add_sound(sndfile);
        end;
    end,
    enter = function(s, f)
        lifeon(s);
        s.lasttext = nil;
        s.wastext = false;
        dofile('theme_vn.lua');
        if not (f.autowired) then
_intro =  true ;
nlb:actf(_syscall_hidemenubtn);
        end;
        s.snd(s);
        vn:request_full_clear();
        vn:lock_direct();
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if v_d4b18a63_4da0_4b5b_ab8a_3da3f6dc16bf.preload then
            geomFuncNeedToCall = false;
            v_d4b18a63_4da0_4b5b_ab8a_3da3f6dc16bf:preload(s);
        else
            vn:gshow(v_d4b18a63_4da0_4b5b_ab8a_3da3f6dc16bf);
        end
        if v_04d2f69b_7b46_45ab_854d_dbb230454344.preload then
            geomFuncNeedToCall = false;
            v_04d2f69b_7b46_45ab_854d_dbb230454344:preload(s);
        else
            vn:gshow(v_04d2f69b_7b46_45ab_854d_dbb230454344);
        end
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
    end,
    exit = function(s, t)
        s.sndout(s);
        s.wastext = false;
        s.lasttext = nil;
        lifeoff(s);
        vn:request_full_clear();
        vn:unlock_direct();
    end,
    life = function(s)
        if vn.stopped then s.autos(s); end;
    end,
    snd = function(s) 
            set_music('sound/svf.ogg', 0);
    end,
    sndout = function(s) end,
};

