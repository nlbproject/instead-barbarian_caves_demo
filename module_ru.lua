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
    _export_lang = 'ru';
    _syscall_showmenubtn:act();
    format.quotes = true;
    if not prefs.achievements then
        prefs.achievements = {};
    end
    if not prefs.achievements['AN_ANNOUNCEMENT'] then prefs.achievements['AN_ANNOUNCEMENT'] = 0; end;
    if not prefs.achievements['A_CONVERSATION'] then prefs.achievements['A_CONVERSATION'] = 0; end;
    if not prefs.achievements['FORTUNES_FAVORITE'] then prefs.achievements['FORTUNES_FAVORITE'] = 0; end;
    if not prefs.achievements['INFORMATION_COLLECTOR'] then prefs.achievements['INFORMATION_COLLECTOR'] = 0; end;
    if not prefs.achievements['THE_CHAMBERLAIN'] then prefs.achievements['THE_CHAMBERLAIN'] = 0; end;
    if not prefs.achievements['THE_PRIEST'] then prefs.achievements['THE_PRIEST'] = 0; end;
    if not prefs.achievements['UNIVERSAL_QUANTIFIER'] then prefs.achievements['UNIVERSAL_QUANTIFIER'] = 0; end;
    if not prefs.achievementNamePerfectGame then prefs.achievementNamePerfectGame = 'UNIVERSAL_QUANTIFIER'; end;
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
-- bigPotionObj
v_ef36ea53_cc31_4501_b656_58403126ff1b = gobj {
preserved = true,
cache_text = true,
    var { tag = ''; container = function() return nil; end; },
    nlbid = 'ef36ea53-cc31-4501-b656-58403126ff1b',
    deref = function(s) return stead.deref(v_ef36ea53_cc31_4501_b656_58403126ff1b); end,
    nam = "bigPotionObj",
    eff = "left-top@0,0",
    arm = { [0] = { 0,0 } },
    snd = function(s) 
    end,
    disp = function(s) return "Большой эликсир" end,
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
            return 'images/big_potion.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_bigPotionObj = v_ef36ea53_cc31_4501_b656_58403126ff1b
-- nightVisionObj
v_3c2dd09b_4aaa_44d4_a98c_e51f02abb8dc = gmenu {
clear_under_tooltip = true,
cache_text = true,
    var { tag = ''; container = function() return v_2f567fe4_34b5_4855_b8e9_020e9cd19c82; end; },
    nlbid = '3c2dd09b-4aaa-44d4-a98c-e51f02abb8dc',
    deref = function(s) return stead.deref(v_3c2dd09b_4aaa_44d4_a98c_e51f02abb8dc); end,
    nam = "nightVisionObj",
    eff = "left-top@0,0",
    arm = { [0] = { 1044,452 } },
    snd = function(s) 
    end,
    disp = function(s) return "Ночное зрение" end,
    dscf = function(s) return "Ночное зрение – позволяет видеть обстановку^"..
"почти в полной темноте, а также издалека^"..
"разглядеть мелкие детали рисунка или надписи."; end,
    dsc = function(s) return s.dscf(s); end,
    tak = function(s)
        s.act(s);
        return true;
    end,
    alive = function(s)
        return ( not _night_vision);
    end,
    life = function(s)
        if not s:alive() then
            nlb._filter[stead.deref(s)] = true;
            s:disable();
        end;
    end,
    revive = function(s)
        if ( not _night_vision) then
            nlb._filter[stead.deref(s)] = false;
            s:enable();
        end;
    end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
    end,
    actt = function(s)
        return "Ночное зрение";
    end,
    actp = function(s)
        nlb:curloc().lasttext = s.actt(s); p(nlb:curloc().lasttext); nlb:curloc().wastext = true;
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
_abilities_count = _abilities_count + 1;
            nlb:addf(v_616221ad_0a7c_45c0_92c5_76114b97fbbc, v_368ccd05_2d56_46c5_a7de_0285a6d208fc, false);
_night_vision = true;
    end,
    pic = function(s)
        if (true) then
            return 'images/sokol.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

lifeon('v_3c2dd09b_4aaa_44d4_a98c_e51f02abb8dc');
_nightVisionObj = v_3c2dd09b_4aaa_44d4_a98c_e51f02abb8dc
-- amuletObj
v_93bcfc6a_7502_4e12_8107_723811db4cb7 = gobj {
preserved = true,
cache_text = true,
    var { tag = ''; container = function() return nil; end; },
    nlbid = '93bcfc6a-7502-4e12-8107-723811db4cb7',
    deref = function(s) return stead.deref(v_93bcfc6a_7502_4e12_8107_723811db4cb7); end,
    nam = "amuletObj",
    eff = "left-top@0,0",
    arm = { [0] = { 0,0 } },
    snd = function(s) 
    end,
    disp = function(s) return "Амулет" end,
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
            return 'images/medalion.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_amuletObj = v_93bcfc6a_7502_4e12_8107_723811db4cb7
-- perceptionObj
v_a1146201_fa2a_4338_8427_9cf95ce96fa1 = gobj {
clear_under_tooltip = true,
cache_text = true,
    var { tag = ''; container = function() return v_2f567fe4_34b5_4855_b8e9_020e9cd19c82; end; },
    nlbid = 'a1146201-fa2a-4338-8427-9cf95ce96fa1',
    deref = function(s) return stead.deref(v_a1146201_fa2a_4338_8427_9cf95ce96fa1); end,
    nam = "perceptionObj",
    eff = "left-top@0,0",
    arm = { [0] = { 158,799 } },
    snd = function(s) 
    end,
    disp = function(s) return "Внимание к деталям" end,
    dscf = function(s) return "Внимание к деталям – позволяет вам замечать мелкие^"..
"детали обстановки или некоторые особенности^"..
"в поведении собеседника.^"..
"Эти детали дают вам иногда полезные подсказки^"..
"и намеки."; end,
    dsc = function(s) return s.dscf(s); end,
    alive = function(s)
        return ( not _perception);
    end,
    life = function(s)
        if not s:alive() then
            nlb._filter[stead.deref(s)] = true;
            s:disable();
        end;
    end,
    revive = function(s)
        if ( not _perception) then
            nlb._filter[stead.deref(s)] = false;
            s:enable();
        end;
    end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
    end,
    actt = function(s)
        return "Внимание к деталям";
    end,
    actp = function(s)
        nlb:curloc().lasttext = s.actt(s); p(nlb:curloc().lasttext); nlb:curloc().wastext = true;
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
_abilities_count = _abilities_count + 1;
            nlb:addf(v_616221ad_0a7c_45c0_92c5_76114b97fbbc, v_5852efb0_4c52_48e6_88e8_6c7fd89edc42, false);
_perception = true;
    end,
    pic = function(s)
        if (true) then
            return 'images/surikat.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

lifeon('v_a1146201_fa2a_4338_8427_9cf95ce96fa1');
_perceptionObj = v_a1146201_fa2a_4338_8427_9cf95ce96fa1
-- abilitiesContainer
v_616221ad_0a7c_45c0_92c5_76114b97fbbc = gobj {
preserved = true,
    var { tag = ''; container = function() return v_6309277f_d6cc_4dde_9826_9eedea4b322d; end; },
    nlbid = '616221ad-0a7c-45c0-92c5-76114b97fbbc',
    deref = function(s) return stead.deref(v_616221ad_0a7c_45c0_92c5_76114b97fbbc); end,
    nam = "abilitiesContainer",
    eff = "left-top@0,0",
    arm = { [0] = { 0,0 } },
    iarm = { [0] = { 35.0, 31.5 } };
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
            return 'images/emptycnt1.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_abilitiesContainer = v_616221ad_0a7c_45c0_92c5_76114b97fbbc
-- nightVisionObj2
v_368ccd05_2d56_46c5_a7de_0285a6d208fc = gobj {
preserved = true,
cache_text = true,
    var { tag = ''; container = function() return nil; end; },
    nlbid = '368ccd05-2d56-46c5-a7de-0285a6d208fc',
    deref = function(s) return stead.deref(v_368ccd05_2d56_46c5_a7de_0285a6d208fc); end,
    nam = "nightVisionObj2",
    eff = "left-top@0,0",
    arm = { [0] = { 0,0 } },
    snd = function(s) 
    end,
    disp = function(s) return "Ночное зрение" end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
    end,
    actt = function(s)
        return "Ночное зрение";
    end,
    actp = function(s)
        nlb:curloc().lasttext = s.actt(s); p(nlb:curloc().lasttext); nlb:curloc().wastext = true;
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
if ((_can_remove_skill)) then
            objs(v_616221ad_0a7c_45c0_92c5_76114b97fbbc):del(v_368ccd05_2d56_46c5_a7de_0285a6d208fc); v_368ccd05_2d56_46c5_a7de_0285a6d208fc.container = function() return nil; end; 
_abilities_count = _abilities_count - 1;
_night_vision =  false ;
end;
    end,
    pic = function(s)
        if (true) then
            return 'images/sokol_1.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_nightVisionObj2 = v_368ccd05_2d56_46c5_a7de_0285a6d208fc
-- moneyObj
v_f97b1d23_0644_4154_8a37_5de4e9e9139b = gobj {
preserved = true,
    var { tag = ''; container = function() return nil; end; },
    nlbid = 'f97b1d23-0644-4154-8a37-5de4e9e9139b',
    deref = function(s) return stead.deref(v_f97b1d23_0644_4154_8a37_5de4e9e9139b); end,
    nam = "moneyObj",
    eff = "left-top@0,0",
    arm = { [0] = { 0,0 } },
    snd = function(s) 
    end,
    disp = function(s) return ""..tostring(_money).." монет" end,
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
            return 'images/meshok2.1.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_moneyObj = v_f97b1d23_0644_4154_8a37_5de4e9e9139b
-- abilitiesMainContainer
v_6309277f_d6cc_4dde_9826_9eedea4b322d = gobj {
preserved = true,
    var { tag = ''; container = function() return v_2f567fe4_34b5_4855_b8e9_020e9cd19c82; end; },
    nlbid = '6309277f-d6cc-4dde-9826-9eedea4b322d',
    deref = function(s) return stead.deref(v_6309277f_d6cc_4dde_9826_9eedea4b322d); end,
    nam = "abilitiesMainContainer",
    eff = "fadein-left-top@1520, 40",
    maxStep = 8,
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
        local v = vn:glookup(stead.deref(s));
        if s.is_paused then
            vn:vpause(v, false);
        else
            vn:set_step(v, nil, not v.forward);
        end
        vn:start();
    end,
    pic = function(s)
        if (true) then
            return 'images/abilitiescntbg.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
    obj = {
        'v_616221ad_0a7c_45c0_92c5_76114b97fbbc',
    },
};

_abilitiesMainContainer = v_6309277f_d6cc_4dde_9826_9eedea4b322d
-- insightObj
v_a7f582e4_ca7d_43d1_9bf4_971a40225fdb = gobj {
clear_under_tooltip = true,
cache_text = true,
    var { tag = ''; container = function() return v_2f567fe4_34b5_4855_b8e9_020e9cd19c82; end; },
    nlbid = 'a7f582e4-ca7d-43d1-9bf4-971a40225fdb',
    deref = function(s) return stead.deref(v_a7f582e4_ca7d_43d1_9bf4_971a40225fdb); end,
    nam = "insightObj",
    eff = "left-top@0,0",
    arm = { [0] = { 158,453 } },
    snd = function(s) 
    end,
    disp = function(s) return "Распознавание лжи" end,
    dscf = function(s) return "Распознавание лжи – позволяет вам чувствовать, что ваш^"..
"собеседник вам лжет или что-то недоговаривает,^"..
"скрывает."; end,
    dsc = function(s) return s.dscf(s); end,
    alive = function(s)
        return ( not _insight);
    end,
    life = function(s)
        if not s:alive() then
            nlb._filter[stead.deref(s)] = true;
            s:disable();
        end;
    end,
    revive = function(s)
        if ( not _insight) then
            nlb._filter[stead.deref(s)] = false;
            s:enable();
        end;
    end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
    end,
    actt = function(s)
        return "Распознавание лжи";
    end,
    actp = function(s)
        nlb:curloc().lasttext = s.actt(s); p(nlb:curloc().lasttext); nlb:curloc().wastext = true;
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
_abilities_count = _abilities_count + 1;
            nlb:addf(v_616221ad_0a7c_45c0_92c5_76114b97fbbc, v_3c2ac7db_ff89_44dc_84a9_1aea1393854e, false);
_insight = true;
    end,
    pic = function(s)
        if (true) then
            return 'images/hameleon.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

lifeon('v_a7f582e4_ca7d_43d1_9bf4_971a40225fdb');
_insightObj = v_a7f582e4_ca7d_43d1_9bf4_971a40225fdb
-- thieveryObj
v_5941498e_6496_4745_9593_597a4f939ac0 = gmenu {
clear_under_tooltip = true,
cache_text = true,
    var { tag = ''; container = function() return v_2f567fe4_34b5_4855_b8e9_020e9cd19c82; end; },
    nlbid = '5941498e-6496-4745-9593-597a4f939ac0',
    deref = function(s) return stead.deref(v_5941498e_6496_4745_9593_597a4f939ac0); end,
    nam = "thieveryObj",
    eff = "left-top@0,0",
    arm = { [0] = { 1047,798 } },
    snd = function(s) 
    end,
    disp = function(s) return "Воровство" end,
    dscf = function(s) return "Воровство - позволяет проследить за кем-либо,^"..
"оставаясь незамеченным, вскрыть замок,^"..
"что-то украсть."; end,
    dsc = function(s) return s.dscf(s); end,
    tak = function(s)
        s.act(s);
        return true;
    end,
    alive = function(s)
        return ( not _thievery);
    end,
    life = function(s)
        if not s:alive() then
            nlb._filter[stead.deref(s)] = true;
            s:disable();
        end;
    end,
    revive = function(s)
        if ( not _thievery) then
            nlb._filter[stead.deref(s)] = false;
            s:enable();
        end;
    end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
    end,
    actt = function(s)
        return "Воровство";
    end,
    actp = function(s)
        nlb:curloc().lasttext = s.actt(s); p(nlb:curloc().lasttext); nlb:curloc().wastext = true;
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
_abilities_count = _abilities_count + 1;
            nlb:addf(v_616221ad_0a7c_45c0_92c5_76114b97fbbc, v_47eb8198_8404_4710_875d_8e0b00873ba4, false);
_thievery = true;
    end,
    pic = function(s)
        if (true) then
            return 'images/makaka.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

lifeon('v_5941498e_6496_4745_9593_597a4f939ac0');
_thieveryObj = v_5941498e_6496_4745_9593_597a4f939ac0
-- inventoryContainer
v_2377b00b_74e5_4c1d_881e_07c2e37409dc = gobj {
preserved = true,
    var { tag = ''; container = function() return v_a660978e_1eee_43ec_9aed_6e68b12d20a8; end; },
    nlbid = '2377b00b-74e5-4c1d-881e-07c2e37409dc',
    deref = function(s) return stead.deref(v_2377b00b_74e5_4c1d_881e_07c2e37409dc); end,
    nam = "inventoryContainer",
    eff = "left-top@0,0",
    arm = { [0] = { 0,0 } },
    iarm = { [0] = { 35.75, 33.0 } };
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
            return 'images/emptycnt1_1.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_inventoryContainer = v_2377b00b_74e5_4c1d_881e_07c2e37409dc
-- hdrObj
v_884bc172_c23e_4007_8158_d0cab60e2172 = gobj {
cache_text = true,
    var { tag = ''; container = function() return v_2f567fe4_34b5_4855_b8e9_020e9cd19c82; end; },
    nlbid = '884bc172-c23e-4007-8158-d0cab60e2172',
    deref = function(s) return stead.deref(v_884bc172_c23e_4007_8158_d0cab60e2172); end,
    nam = "hdrObj",
    eff = "left-top@550,50",
    snd = function(s) 
    end,
    disp = function(s) return "ВЫБЕРИТЕ ТРИ ЛЮБЫХ НАВЫКА" end,
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
            return 'images/empty_1.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_hdrObj = v_884bc172_c23e_4007_8158_d0cab60e2172
-- canReadObj2
v_daa07b24_e6fd_4f7e_a2e5_f1f5399927c6 = gobj {
preserved = true,
cache_text = true,
    var { tag = ''; container = function() return nil; end; },
    nlbid = 'daa07b24-e6fd-4f7e-a2e5-f1f5399927c6',
    deref = function(s) return stead.deref(v_daa07b24_e6fd_4f7e_a2e5_f1f5399927c6); end,
    nam = "canReadObj2",
    eff = "left-top@0,0",
    arm = { [0] = { 0,0 } },
    snd = function(s) 
    end,
    disp = function(s) return "Грамотность" end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
    end,
    actt = function(s)
        return "Грамотность";
    end,
    actp = function(s)
        nlb:curloc().lasttext = s.actt(s); p(nlb:curloc().lasttext); nlb:curloc().wastext = true;
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
if ((_can_remove_skill)) then
            objs(v_616221ad_0a7c_45c0_92c5_76114b97fbbc):del(v_daa07b24_e6fd_4f7e_a2e5_f1f5399927c6); v_daa07b24_e6fd_4f7e_a2e5_f1f5399927c6.container = function() return nil; end; 
_abilities_count = _abilities_count - 1;
_can_read =  false ;
end;
    end,
    pic = function(s)
        if (true) then
            return 'images/owl_1.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_canReadObj2 = v_daa07b24_e6fd_4f7e_a2e5_f1f5399927c6
-- canReadObj
v_4450e6ec_3d92_4889_b8c4_d2d3de873f47 = gobj {
clear_under_tooltip = true,
cache_text = true,
    var { tag = ''; container = function() return v_2f567fe4_34b5_4855_b8e9_020e9cd19c82; end; },
    nlbid = '4450e6ec-3d92-4889-b8c4-d2d3de873f47',
    deref = function(s) return stead.deref(v_4450e6ec_3d92_4889_b8c4_d2d3de873f47); end,
    nam = "canReadObj",
    eff = "left-top@0,0",
    arm = { [0] = { 160,153 } },
    snd = function(s) 
    end,
    disp = function(s) return "Грамотность" end,
    dscf = function(s) return "Грамотность – позволяет вам прочесть надпись^"..
"на стене или на вывеске таверны, а также^"..
"самому написать что-либо."; end,
    dsc = function(s) return s.dscf(s); end,
    alive = function(s)
        return ( not _can_read);
    end,
    life = function(s)
        if not s:alive() then
            nlb._filter[stead.deref(s)] = true;
            s:disable();
        end;
    end,
    revive = function(s)
        if ( not _can_read) then
            nlb._filter[stead.deref(s)] = false;
            s:enable();
        end;
    end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
    end,
    actt = function(s)
        return "Грамотность";
    end,
    actp = function(s)
        nlb:curloc().lasttext = s.actt(s); p(nlb:curloc().lasttext); nlb:curloc().wastext = true;
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
_abilities_count = _abilities_count + 1;
            nlb:addf(v_616221ad_0a7c_45c0_92c5_76114b97fbbc, v_daa07b24_e6fd_4f7e_a2e5_f1f5399927c6, false);
_can_read = true;
    end,
    pic = function(s)
        if (true) then
            return 'images/owl.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

lifeon('v_4450e6ec_3d92_4889_b8c4_d2d3de873f47');
_canReadObj = v_4450e6ec_3d92_4889_b8c4_d2d3de873f47
-- hearingObj
v_a43d552c_fcbf_4114_8952_0b2b93696de0 = gmenu {
clear_under_tooltip = true,
cache_text = true,
    var { tag = ''; container = function() return v_2f567fe4_34b5_4855_b8e9_020e9cd19c82; end; },
    nlbid = 'a43d552c-fcbf-4114-8952-0b2b93696de0',
    deref = function(s) return stead.deref(v_a43d552c_fcbf_4114_8952_0b2b93696de0); end,
    nam = "hearingObj",
    eff = "left-top@0,0",
    arm = { [0] = { 1039,155 } },
    snd = function(s) 
    end,
    disp = function(s) return "Острый слух" end,
    dscf = function(s) return "Острый слух – позволяет услышать далекие звуки^"..
"и понять с какой стороны они идут.^"..
"Также даёт возможность подслушать тихий^"..
"разговор за соседним столиком.^"..
"Даже сквозь сон герой может различить^"..
"подозрительные шорохи и вовремя среагировать."; end,
    dsc = function(s) return s.dscf(s); end,
    tak = function(s)
        s.act(s);
        return true;
    end,
    alive = function(s)
        return ( not _hearing);
    end,
    life = function(s)
        if not s:alive() then
            nlb._filter[stead.deref(s)] = true;
            s:disable();
        end;
    end,
    revive = function(s)
        if ( not _hearing) then
            nlb._filter[stead.deref(s)] = false;
            s:enable();
        end;
    end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
    end,
    actt = function(s)
        return "Острый слух";
    end,
    actp = function(s)
        nlb:curloc().lasttext = s.actt(s); p(nlb:curloc().lasttext); nlb:curloc().wastext = true;
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
_abilities_count = _abilities_count + 1;
            nlb:addf(v_616221ad_0a7c_45c0_92c5_76114b97fbbc, v_c0a75945_02f5_484e_bd31_ba41daef72ff, false);
_hearing = true;
    end,
    pic = function(s)
        if (true) then
            return 'images/bat1.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

lifeon('v_a43d552c_fcbf_4114_8952_0b2b93696de0');
_hearingObj = v_a43d552c_fcbf_4114_8952_0b2b93696de0
-- monsterPotionObj
v_b30b4c2b_c4ad_4607_b23a_38f7de7c40ba = gobj {
preserved = true,
cache_text = true,
    var { tag = ''; container = function() return nil; end; },
    nlbid = 'b30b4c2b-c4ad-4607-b23a-38f7de7c40ba',
    deref = function(s) return stead.deref(v_b30b4c2b_c4ad_4607_b23a_38f7de7c40ba); end,
    nam = "monsterPotionObj",
    eff = "left-top@0,0",
    arm = { [0] = { 0,0 } },
    snd = function(s) 
    end,
    disp = function(s) return "Большой эликсир" end,
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
            return 'images/big_potion.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_monsterPotionObj = v_b30b4c2b_c4ad_4607_b23a_38f7de7c40ba
-- abilitiesTrigger
v_f9fc1dc1_81bd_4b79_926b_80a42b08b87f = gobj {
preserved = true,
    var { tag = 'LangEn'; container = function() return v_2f567fe4_34b5_4855_b8e9_020e9cd19c82; end; },
    nlbid = 'f9fc1dc1-81bd-4b79-926b-80a42b08b87f',
    deref = function(s) return stead.deref(v_f9fc1dc1_81bd_4b79_926b_80a42b08b87f); end,
    nam = "abilitiesTrigger",
    eff = "left-top@1550,0",
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
nlb:actf(v_6309277f_d6cc_4dde_9826_9eedea4b322d);
    end,
    pic = function(s)
        if (s.tag == 'LangEn') then
            return 'images/abilities.png';
        elseif (s.tag == 'LangRu') then
            return 'images/abilities_ru.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_abilitiesTrigger = v_f9fc1dc1_81bd_4b79_926b_80a42b08b87f
-- insightObj2
v_3c2ac7db_ff89_44dc_84a9_1aea1393854e = gobj {
preserved = true,
cache_text = true,
    var { tag = ''; container = function() return nil; end; },
    nlbid = '3c2ac7db-ff89-44dc-84a9-1aea1393854e',
    deref = function(s) return stead.deref(v_3c2ac7db_ff89_44dc_84a9_1aea1393854e); end,
    nam = "insightObj2",
    eff = "left-top@0,0",
    arm = { [0] = { 0,0 } },
    snd = function(s) 
    end,
    disp = function(s) return "Распознавание лжи" end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
    end,
    actt = function(s)
        return "Распознавание лжи";
    end,
    actp = function(s)
        nlb:curloc().lasttext = s.actt(s); p(nlb:curloc().lasttext); nlb:curloc().wastext = true;
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
if ((_can_remove_skill)) then
            objs(v_616221ad_0a7c_45c0_92c5_76114b97fbbc):del(v_3c2ac7db_ff89_44dc_84a9_1aea1393854e); v_3c2ac7db_ff89_44dc_84a9_1aea1393854e.container = function() return nil; end; 
_abilities_count = _abilities_count - 1;
_insight =  false ;
end;
    end,
    pic = function(s)
        if (true) then
            return 'images/hameleon_1.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_insightObj2 = v_3c2ac7db_ff89_44dc_84a9_1aea1393854e
-- inventoryTrigger
v_e77a748a_b7b2_4473_9c13_6d90ec3d8a30 = gobj {
preserved = true,
    var { tag = 'LangEn'; container = function() return v_32260bf6_bab2_4ebc_8f17_dd1ab32dfaf9; end; },
    nlbid = 'e77a748a-b7b2-4473-9c13-6d90ec3d8a30',
    deref = function(s) return stead.deref(v_e77a748a_b7b2_4473_9c13_6d90ec3d8a30); end,
    nam = "inventoryTrigger",
    eff = "left-top@1150,0",
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
nlb:actf(v_a660978e_1eee_43ec_9aed_6e68b12d20a8);
    end,
    pic = function(s)
        if (s.tag == 'LangEn') then
            return 'images/inventory.png';
        elseif (s.tag == 'LangRu') then
            return 'images/inventory_ru.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_inventoryTrigger = v_e77a748a_b7b2_4473_9c13_6d90ec3d8a30
-- headObj
v_aeeabcf3_2267_4aa7_b27c_1f69e6b3d728 = gobj {
preserved = true,
cache_text = true,
    var { tag = ''; container = function() return nil; end; },
    nlbid = 'aeeabcf3-2267-4aa7-b27c-1f69e6b3d728',
    deref = function(s) return stead.deref(v_aeeabcf3_2267_4aa7_b27c_1f69e6b3d728); end,
    nam = "headObj",
    eff = "left-top@0,0",
    arm = { [0] = { 0,0 } },
    snd = function(s) 
    end,
    disp = function(s) return "Голова Чудища" end,
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
            return 'images/head.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_headObj = v_aeeabcf3_2267_4aa7_b27c_1f69e6b3d728
-- undefLangObj
v_d2f8c453_fed5_4d79_b12c_8d9ab1319df7 = obj {
    var { tag = ''; container = function() return nil; end; },
    nlbid = 'd2f8c453-fed5-4d79-b12c-8d9ab1319df7',
    deref = function(s) return stead.deref(v_d2f8c453_fed5_4d79_b12c_8d9ab1319df7); end,
    nam = "undefLangObj",
    snd = function(s) 
    end,
    disp = function(s) return false; end,
    dscf = function(s) end,
    dsc = function(s) p(s.dscf(s)); end,
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
_export_lang = "undef";
    end,
};

_undefLangObj = v_d2f8c453_fed5_4d79_b12c_8d9ab1319df7
-- hearingObj2
v_c0a75945_02f5_484e_bd31_ba41daef72ff = gobj {
preserved = true,
cache_text = true,
    var { tag = ''; container = function() return nil; end; },
    nlbid = 'c0a75945-02f5-484e-bd31-ba41daef72ff',
    deref = function(s) return stead.deref(v_c0a75945_02f5_484e_bd31_ba41daef72ff); end,
    nam = "hearingObj2",
    eff = "left-top@0,0",
    arm = { [0] = { 0,0 } },
    snd = function(s) 
    end,
    disp = function(s) return "Острый слух" end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
    end,
    actt = function(s)
        return "Острый слух";
    end,
    actp = function(s)
        nlb:curloc().lasttext = s.actt(s); p(nlb:curloc().lasttext); nlb:curloc().wastext = true;
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
if ((_can_remove_skill)) then
            objs(v_616221ad_0a7c_45c0_92c5_76114b97fbbc):del(v_c0a75945_02f5_484e_bd31_ba41daef72ff); v_c0a75945_02f5_484e_bd31_ba41daef72ff.container = function() return nil; end; 
_abilities_count = _abilities_count - 1;
_hearing =  false ;
end;
    end,
    pic = function(s)
        if (true) then
            return 'images/bat1_1.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_hearingObj2 = v_c0a75945_02f5_484e_bd31_ba41daef72ff
-- noteObj
v_40e61fff_52d2_4377_822b_01840a176fa2 = gobj {
cache_text = true,
    var { tag = ''; container = function() return v_2f567fe4_34b5_4855_b8e9_020e9cd19c82; end; },
    nlbid = '40e61fff-52d2-4377-822b-01840a176fa2',
    deref = function(s) return stead.deref(v_40e61fff_52d2_4377_822b_01840a176fa2); end,
    nam = "noteObj",
    eff = "left-top@250, 1030",
    snd = function(s) 
    end,
    disp = function(s) return "Чтобы выбрать навык, кликните по его иконке в большом свитке. Если вы случайно выбрали не тот навык,^"..
"кликните по его иконке на маленьком свитке, и он вернётся обратно в большой." end,
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
            return 'images/empty_1_1.jpg';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_noteObj = v_40e61fff_52d2_4377_822b_01840a176fa2
-- inventoryMainContainer
v_a660978e_1eee_43ec_9aed_6e68b12d20a8 = gobj {
preserved = true,
    var { tag = ''; container = function() return v_32260bf6_bab2_4ebc_8f17_dd1ab32dfaf9; end; },
    nlbid = 'a660978e-1eee-43ec-9aed-6e68b12d20a8',
    deref = function(s) return stead.deref(v_a660978e_1eee_43ec_9aed_6e68b12d20a8); end,
    nam = "inventoryMainContainer",
    eff = "fadein-left-top@1120, 40",
    maxStep = 8,
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
        local v = vn:glookup(stead.deref(s));
        if s.is_paused then
            vn:vpause(v, false);
        else
            vn:set_step(v, nil, not v.forward);
        end
        vn:start();
    end,
    pic = function(s)
        if (true) then
            return 'images/inventorycntbg.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
    obj = {
        'v_2377b00b_74e5_4c1d_881e_07c2e37409dc',
    },
};

_inventoryMainContainer = v_a660978e_1eee_43ec_9aed_6e68b12d20a8
-- thieveryObj2
v_47eb8198_8404_4710_875d_8e0b00873ba4 = gobj {
preserved = true,
cache_text = true,
    var { tag = ''; container = function() return nil; end; },
    nlbid = '47eb8198-8404-4710-875d-8e0b00873ba4',
    deref = function(s) return stead.deref(v_47eb8198_8404_4710_875d_8e0b00873ba4); end,
    nam = "thieveryObj2",
    eff = "left-top@0,0",
    arm = { [0] = { 0,0 } },
    snd = function(s) 
    end,
    disp = function(s) return "Воровство" end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
    end,
    actt = function(s)
        return "Воровство";
    end,
    actp = function(s)
        nlb:curloc().lasttext = s.actt(s); p(nlb:curloc().lasttext); nlb:curloc().wastext = true;
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
if ((_can_remove_skill)) then
            objs(v_616221ad_0a7c_45c0_92c5_76114b97fbbc):del(v_47eb8198_8404_4710_875d_8e0b00873ba4); v_47eb8198_8404_4710_875d_8e0b00873ba4.container = function() return nil; end; 
_abilities_count = _abilities_count - 1;
_thievery =  false ;
end;
    end,
    pic = function(s)
        if (true) then
            return 'images/makaka_1.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_thieveryObj2 = v_47eb8198_8404_4710_875d_8e0b00873ba4
-- smallPotionObj
v_c881833d_04a4_450f_8f7b_b6b5f5e565c9 = gobj {
preserved = true,
cache_text = true,
    var { tag = ''; container = function() return nil; end; },
    nlbid = 'c881833d-04a4-450f-8f7b-b6b5f5e565c9',
    deref = function(s) return stead.deref(v_c881833d_04a4_450f_8f7b_b6b5f5e565c9); end,
    nam = "smallPotionObj",
    eff = "left-top@0,0",
    arm = { [0] = { 0,0 } },
    snd = function(s) 
    end,
    disp = function(s) return "Малый эликсир" end,
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
            return 'images/small_potion.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_smallPotionObj = v_c881833d_04a4_450f_8f7b_b6b5f5e565c9
-- perceptionObj2
v_5852efb0_4c52_48e6_88e8_6c7fd89edc42 = gobj {
preserved = true,
cache_text = true,
    var { tag = ''; container = function() return nil; end; },
    nlbid = '5852efb0-4c52-48e6-88e8-6c7fd89edc42',
    deref = function(s) return stead.deref(v_5852efb0_4c52_48e6_88e8_6c7fd89edc42); end,
    nam = "perceptionObj2",
    eff = "left-top@0,0",
    arm = { [0] = { 0,0 } },
    snd = function(s) 
    end,
    disp = function(s) return "Внимание к деталям" end,
    dscf = function(s) end,
    dsc = function(s) return s.dscf(s); end,
    used = function(s, w)
    end,
    act = function(s)
        s:acta();
    end,
    actt = function(s)
        return "Внимание к деталям";
    end,
    actp = function(s)
        nlb:curloc().lasttext = s.actt(s); p(nlb:curloc().lasttext); nlb:curloc().wastext = true;
    end,
    acta = function(s)
        s:actp();
        s:actf();
    end,
    actf = function(s)
if ((_can_remove_skill)) then
            objs(v_616221ad_0a7c_45c0_92c5_76114b97fbbc):del(v_5852efb0_4c52_48e6_88e8_6c7fd89edc42); v_5852efb0_4c52_48e6_88e8_6c7fd89edc42.container = function() return nil; end; 
_abilities_count = _abilities_count - 1;
_perception =  false ;
end;
    end,
    pic = function(s)
        if (true) then
            return 'images/surikat_1.png';

        end
end,
    imgv = function(s) return img(s.pic(s)); end,
};

_perceptionObj2 = v_5852efb0_4c52_48e6_88e8_6c7fd89edc42
-- 
main, v_2f567fe4_34b5_4855_b8e9_020e9cd19c82 = room { nam = "main", enter = function(s) nlb:nlbwalk(s, v_2f567fe4_34b5_4855_b8e9_020e9cd19c82); end }, vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    notes = "",
    bgimg = function(s)
        if (true) then
            return 'images/page3.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
    end,
    autos = function(s)
        nlb:revive();
        if ((_abilities_count ~= nil) and (_abilities_count == 3)) then         nlb:nlbwalk(s, v_32260bf6_bab2_4ebc_8f17_dd1ab32dfaf9); 

        return false;
 end;
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_2f567fe4_34b5_4855_b8e9_020e9cd19c82_snds');
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
_abilities_count = 0;
_can_remove_skill =  true ;
if ((_export_lang ~= nil) and (_export_lang == 'ru')) then
v_f9fc1dc1_81bd_4b79_926b_80a42b08b87f.tag = 'LangRu';
v_e77a748a_b7b2_4473_9c13_6d90ec3d8a30.tag = 'LangRu';
else
v_f9fc1dc1_81bd_4b79_926b_80a42b08b87f.tag = 'LangEn';
v_e77a748a_b7b2_4473_9c13_6d90ec3d8a30.tag = 'LangEn';
end;
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
        if v_4450e6ec_3d92_4889_b8c4_d2d3de873f47.preload then
            geomFuncNeedToCall = false;
            v_4450e6ec_3d92_4889_b8c4_d2d3de873f47:preload(s);
        else
            vn:gshow(v_4450e6ec_3d92_4889_b8c4_d2d3de873f47);
        end
        if v_a43d552c_fcbf_4114_8952_0b2b93696de0.preload then
            geomFuncNeedToCall = false;
            v_a43d552c_fcbf_4114_8952_0b2b93696de0:preload(s);
        else
            vn:gshow(v_a43d552c_fcbf_4114_8952_0b2b93696de0);
        end
        if v_a7f582e4_ca7d_43d1_9bf4_971a40225fdb.preload then
            geomFuncNeedToCall = false;
            v_a7f582e4_ca7d_43d1_9bf4_971a40225fdb:preload(s);
        else
            vn:gshow(v_a7f582e4_ca7d_43d1_9bf4_971a40225fdb);
        end
        if v_3c2dd09b_4aaa_44d4_a98c_e51f02abb8dc.preload then
            geomFuncNeedToCall = false;
            v_3c2dd09b_4aaa_44d4_a98c_e51f02abb8dc:preload(s);
        else
            vn:gshow(v_3c2dd09b_4aaa_44d4_a98c_e51f02abb8dc);
        end
        if v_a1146201_fa2a_4338_8427_9cf95ce96fa1.preload then
            geomFuncNeedToCall = false;
            v_a1146201_fa2a_4338_8427_9cf95ce96fa1:preload(s);
        else
            vn:gshow(v_a1146201_fa2a_4338_8427_9cf95ce96fa1);
        end
        if v_5941498e_6496_4745_9593_597a4f939ac0.preload then
            geomFuncNeedToCall = false;
            v_5941498e_6496_4745_9593_597a4f939ac0:preload(s);
        else
            vn:gshow(v_5941498e_6496_4745_9593_597a4f939ac0);
        end
        if v_6309277f_d6cc_4dde_9826_9eedea4b322d.preload then
            geomFuncNeedToCall = false;
            v_6309277f_d6cc_4dde_9826_9eedea4b322d:preload(s);
        else
            vn:gshow(v_6309277f_d6cc_4dde_9826_9eedea4b322d);
        end
        if v_f9fc1dc1_81bd_4b79_926b_80a42b08b87f.preload then
            geomFuncNeedToCall = false;
            v_f9fc1dc1_81bd_4b79_926b_80a42b08b87f:preload(s);
        else
            vn:gshow(v_f9fc1dc1_81bd_4b79_926b_80a42b08b87f);
        end
        if v_884bc172_c23e_4007_8158_d0cab60e2172.preload then
            geomFuncNeedToCall = false;
            v_884bc172_c23e_4007_8158_d0cab60e2172:preload(s);
        else
            vn:gshow(v_884bc172_c23e_4007_8158_d0cab60e2172);
        end
        if v_40e61fff_52d2_4377_822b_01840a176fa2.preload then
            geomFuncNeedToCall = false;
            v_40e61fff_52d2_4377_822b_01840a176fa2:preload(s);
        else
            vn:gshow(v_40e61fff_52d2_4377_822b_01840a176fa2);
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

-- !НОВАЯ!
v_5027f76f_9cee_4aab_89bc_32c60a60d323 = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    notes = "!НОВАЯ!",
    bgimg = function(s)
        if (true) then
            return 'images/006f21.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Рагнар, как человек выросший на природе, в суровых, полудиких условиях предгорий, вынужденный с раннего детства бороться за выживание, не мог позволить себе такую роскошь, как умение читать, да и научить его было некому.");
pn();
pn(" Но зато он обладал большим количеством других достоинств. Например, огромной силой, высоким ростом и весьма брутальной внешностью, которая производила на людей неизгладимое впечатление: в женщинах воспламеняя чувства, а мужчин заставляя трепетать от страха.");
pn();
pn("");
pn();
pn("Зная, какое действие его внешность оказывает на людей, Рагнар взглядом искал в толпе отнюдь не самого хилого горожанина.");
pn();
    end,
    walk_to = "v_5027f76f_9cee_4aab_89bc_32c60a60d323_choices",
    autos = function(s)
        nlb:revive();
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_5027f76f_9cee_4aab_89bc_32c60a60d323_snds');
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
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
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
    end,
    sndout = function(s) end,
};

v_5027f76f_9cee_4aab_89bc_32c60a60d323_choices = room {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        nlb:nlbwalk(s, v_aaeb491e_a859_480b_926b_86cedb7a466f); 
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- ++23
v_7c3a320e_25dd_4a9c_96ed_d33937ef4e82 = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    notes = "++23",
    bgimg = function(s)
        if (true) then
            return 'images/013f21.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Все кружки устремились к центру стола и глухо стукнулись друг о друга. Залпом выпив прохладную жидкость, Рагнар спросил:");
pn();
pn("– Чем вы занимаетесь в этом городе?");
pn();
pn("– Мы водовозы, – хрипло ответил самый старший. Работёнка та ещё, но на хлеб хватает.");
pn();
pn("– Да, тяжела, – вздохнул ещё совсем молодой с виду парень.");
pn();
pn("– Если бы дело было только в этом, – отозвался его жилистый долговязый сосед, – так ведь теперь набирать воду стало опасно.");
pn();
pn("– И не говори, – пожилой водовоз закашлялся, но вскоре продолжил: – Если так пойдёт и дальше, придётся искать другой заработок. На несколько секунд воцарилось молчание, которое нарушил Рагнар:");
pn();
pn("– Что у вас тут происходит?");
pn();
pn("– Под колодцем, где мы набираем воду, есть пещеры, – начал хрипло рассказывать старик, – так вот там завелось чудовище.");
pn();
pn(" Откуда оно взялось никто не знает, но оно, похоже, подстерегает у колодца. Уже пропало несколько наших.");
pn();
pn("");
pn();
pn("– А я слышал, что оно умеет разговаривать совсем как человек.");
pn();
pn("– Кто тебе это сказал? Призрак с того света? – загоготал шутник.");
pn();
pn("– Управляющий даже назначил приличную награду тому, кто убьёт зверя, – заплетающимся языком проговорил долговязый, – только кто ж в здравом уме полезет в пещеры? Или заблудишься в лабиринте, или угодишь в пасть чудища.");
pn();
pn("К этому моменту изнуряющая духота и вино сделали своё дело и вся компания, включая Рагнара, порядком опьянела.");
pn();
    end,
    walk_to = "v_7c3a320e_25dd_4a9c_96ed_d33937ef4e82_choices",
    autos = function(s)
        nlb:revive();
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_7c3a320e_25dd_4a9c_96ed_d33937ef4e82_snds');
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
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
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
    end,
    sndout = function(s) end,
};

v_7c3a320e_25dd_4a9c_96ed_d33937ef4e82_choices = room {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        nlb:nlbwalk(s, v_26712782_4b4c_4765_964c_9f94e42664c7); 
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- ++17
v_cd01ced2_7870_4e4e_82ad_f92e39ea74f3 = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    notes = "++17",
    bgimg = function(s)
        if (true) then
            return 'images/011f21.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Питейное заведение располагалось в небольшом одноэтажном строении, внутри было полно народу, очевидно, жажда мучила не только Рагнара.");
pn();
pn(" Осмотревшись, лемуриец заметил, что слева люди просто пили и беседовали, а справа, за несколькими столиками шла игра в кости.");
pn();
pn("");
pn();
    end,
    walk_to = "v_cd01ced2_7870_4e4e_82ad_f92e39ea74f3_choices",
    autos = function(s)
        nlb:revive();
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_cd01ced2_7870_4e4e_82ad_f92e39ea74f3_snds');
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
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
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
            set_music('sound/6.ogg', 0);
    end,
    sndout = function(s) end,
};

v_cd01ced2_7870_4e4e_82ad_f92e39ea74f3_choices = room {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        vn.skip_mode = false;
        put(v_4957ac01_6ba9_47e3_998f_768fd10bbde1);
        put(v_7bd82aba_7920_4a0e_b589_c3abeb230ed5);
        vn:geom(320, 320, 1280, 480, 'dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_4957ac01_6ba9_47e3_998f_768fd10bbde1 = menu {
    nam = "v_4957ac01_6ba9_47e3_998f_768fd10bbde1",
    dsc = function(s) return "{Сыграть в кости}^^" end, 
    act = function(s) 
    _played_two_ais = 0;
        nlb:nlbwalk(s, v_c70a01be_0d99_4c1b_b759_0b5f1fee6378); 
    end
}

v_7bd82aba_7920_4a0e_b589_c3abeb230ed5 = menu {
    nam = "v_7bd82aba_7920_4a0e_b589_c3abeb230ed5",
    dsc = function(s) return "{Просто выпить вина}^^" end, 
    act = function(s) 
        nlb:nlbwalk(s, v_718c5b98_0c2a_4cd1_9c06_7d3c96fd6034); 
    end
}

-- Рагнар видит объявление++Eng.5
v_1f2e7e23_d775_4e22_808a_68cf585ca9a1 = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    notes = "Рагнар видит объявление++Eng.5",
    bgimg = function(s)
        if (true) then
            return 'images/003f21.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Подобравшись на достаточное расстояние, Рагнар заметил надпись, сделанную прямо на каменной стене.");
pn();
    end,
    walk_to = "v_1f2e7e23_d775_4e22_808a_68cf585ca9a1_choices",
    autos = function(s)
        nlb:revive();
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_1f2e7e23_d775_4e22_808a_68cf585ca9a1_snds');
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
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
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
    end,
    sndout = function(s) end,
};

v_1f2e7e23_d775_4e22_808a_68cf585ca9a1_choices = room {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if (_can_read) then
        put(v_392c08d4_a086_462f_b32f_3d3f85bd5e1b);
end;
if (_hearing) then
        put(v_ce065b41_2091_4393_894d_ebb6494d0a8c);
end;
if ( not _can_read) then
        put(v_bad9d750_d971_4eba_9ad9_a26fc4528268);
end;
if (_can_read) then
        put(v_661fda60_65c0_4d82_b71b_624c55a9ae14);
end;
        vn:geom(320, 320, 1280, 480, 'dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_392c08d4_a086_462f_b32f_3d3f85bd5e1b = menu {
    nam = "v_392c08d4_a086_462f_b32f_3d3f85bd5e1b",
    dsc = function(s) return "{Подойти и прочитать объявление}^^" end, 
    act = function(s) 
        nlb:nlbwalk(s, v_fc92ebe0_b3e5_463b_8541_243bede96afc); 
    end
}

v_ce065b41_2091_4393_894d_ebb6494d0a8c = menu {
    nam = "v_ce065b41_2091_4393_894d_ebb6494d0a8c",
    dsc = function(s) return "{Подслушать разговор двух горожан}^^" end, 
    act = function(s) 
        nlb:nlbwalk(s, v_c3b5f286_c3c6_4616_abfb_14c938e99785); 
    end
}

v_bad9d750_d971_4eba_9ad9_a26fc4528268 = menu {
    nam = "v_bad9d750_d971_4eba_9ad9_a26fc4528268",
    dsc = function(s) return "{Спросить у кого-нибудь из толпы}^^" end, 
    act = function(s) 
        nlb:nlbwalk(s, v_5027f76f_9cee_4aab_89bc_32c60a60d323); 
    end
}

v_661fda60_65c0_4d82_b71b_624c55a9ae14 = menu {
    nam = "v_661fda60_65c0_4d82_b71b_624c55a9ae14",
    dsc = function(s) return "{Спросить у кого-нибудь из толпы}^^" end, 
    act = function(s) 
        nlb:nlbwalk(s, v_f0407786_138b_4ef6_b94c_3dd25b95a2c4); 
    end
}

-- Перед листовкой. Eng.++6
v_fc92ebe0_b3e5_463b_8541_243bede96afc = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    notes = "Перед листовкой. Eng.++6",
    bgimg = function(s)
        if (true) then
            return 'images/004f1.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Объявление гласило: \"Любой, кто убьёт чудовище и принесёт в доказательство его голову, получит большое вознаграждение\". И ниже: Управляющий Абу Али Абухар.");
pn();
pn("");
pn();
pn("\"То что нужно\", – подумал Рагнар, не упускавший возможность подзаработать, так как деньги требовались ему всегда. Хмыкнув в предвкушении золота, он решил немедленно отправиться к управляющему.");
pn();
    end,
    walk_to = "v_fc92ebe0_b3e5_463b_8541_243bede96afc_choices",
    autos = function(s)
        nlb:revive();
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_fc92ebe0_b3e5_463b_8541_243bede96afc_snds');
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
nlb:setAchievement(statsAPI, 'AN_ANNOUNCEMENT');
        end;
        s.snd(s);
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
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
    end,
    sndout = function(s) end,
};

v_fc92ebe0_b3e5_463b_8541_243bede96afc_choices = room {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        nlb:nlbwalk(s, v_63386fc4_cf68_4ba4_ab21_2695bc1f6d4c); 
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- Видит толпу++4
v_20812e7b_9e70_448d_a3f4_38847f5f721e = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    notes = "Видит толпу++4",
    bgimg = function(s)
        if (true) then
            return 'images/003f21.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Вскоре его внимание привлекла стоящая особняком группа людей, которая гудела словно пчелиный рой. Рагнар подошёл ближе.");
pn();
pn(" Лемуриец очень удивился тому, что эти люди даже не обратили на него внимания, ведь при появлении его массивной высокой фигуры все обычно расступались.");
pn();
pn("");
pn();
pn("");
pn();
pn("\"Надо узнать, что там\", – подумал мужчина, и принялся прокладывать себе путь, интенсивно работая локтями.");
pn();
pn(" В этот момент, его высокая, статная фигура напоминала скалу, возвышающуюся над поверхностью бурного моря.");
pn();
pn("");
pn();
    end,
    walk_to = "v_20812e7b_9e70_448d_a3f4_38847f5f721e_choices",
    autos = function(s)
        nlb:revive();
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_20812e7b_9e70_448d_a3f4_38847f5f721e_snds');
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
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
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
    end,
    sndout = function(s) end,
};

v_20812e7b_9e70_448d_a3f4_38847f5f721e_choices = room {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        nlb:nlbwalk(s, v_1f2e7e23_d775_4e22_808a_68cf585ca9a1); 
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- Рагнар у колодца. Нет восприятия.Eng.++33
v_51c9e622_bd05_4ff8_95c1_f0d611c381f1 = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    notes = "Рагнар у колодца. Нет восприятия.Eng.++33",
    bgimg = function(s)
        if (true) then
            return 'images/008f21.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Когда первый луч солнца, показавшись из-за горизонта, озарил небо и побежал по земле, Рагнар уже стоял у колодца.");
pn();
pn(" Здесь, в засохшей грязи, застыло множество следов. Бугорки на земле отбрасывали причудливые тени в лучах восходящего солнца.");
pn();
pn(" Кроме большого количества различных отпечатков на земле, лемуриец не обнаружил здесь ничего интересного и сразу направился к пещерам.");
pn();
pn("");
pn();
    end,
    walk_to = "v_51c9e622_bd05_4ff8_95c1_f0d611c381f1_choices",
    autos = function(s)
        nlb:revive();
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_51c9e622_bd05_4ff8_95c1_f0d611c381f1_snds');
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
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
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
            set_music('sound/3.ogg', 0);
    end,
    sndout = function(s) end,
};

v_51c9e622_bd05_4ff8_95c1_f0d611c381f1_choices = room {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        nlb:nlbwalk(s, v_b4244a87_6a99_4146_806c_23528bd9752c); 
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- У Управляющего. Тот рассказывает, что Тварь убивает водоносов, подстерегая их у колодца. Пойти и замочить. Даст денег.Eng.++12
v_63386fc4_cf68_4ba4_ab21_2695bc1f6d4c = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    notes = "У Управляющего. Тот рассказывает, что Тварь убивает водоносов, подстерегая их у колодца. Пойти и замочить. Даст денег.Eng.++12",
    bgimg = function(s)
        if (true) then
            return 'images/020f1.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Управляющий принял посетителя сразу же как только узнал о цели его визита. Рагнар уверенно вошёл в роскошно обставленную комнату.");
pn();
    end,
    walk_to = "v_63386fc4_cf68_4ba4_ab21_2695bc1f6d4c_choices",
    autos = function(s)
        nlb:revive();
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_63386fc4_cf68_4ba4_ab21_2695bc1f6d4c_snds');
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
_forMoney = true;
        end;
        s.snd(s);
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
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
            set_music('sound/2.ogg', 0);
    end,
    sndout = function(s) end,
};

v_63386fc4_cf68_4ba4_ab21_2695bc1f6d4c_choices = room {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        nlb:nlbwalk(s, v_fc39768c_3036_4995_95d2_41d41e2b46a9); 
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 28
v_70a81846_e3ff_4044_869d_e4673cc16cfe = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    notes = "28",
    bgimg = function(s)
        if (true) then
            return 'images/328f32.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Пройдя несколько метров, воин обернулся и с некоторой долей удивления обнаружил, что позади никого нет. Насмешливо хмыкнув, Рагнар продолжил путь.");
pn();
    end,
    walk_to = "v_70a81846_e3ff_4044_869d_e4673cc16cfe_choices",
    autos = function(s)
        nlb:revive();
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_70a81846_e3ff_4044_869d_e4673cc16cfe_snds');
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
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
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
    end,
    sndout = function(s) end,
};

v_70a81846_e3ff_4044_869d_e4673cc16cfe_choices = room {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        nlb:nlbwalk(s, v_f17f49bc_84fb_475c_9e0c_9c1334b55bcf); 
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- Толпа не доверяет, приходится подслушать.Eng.++7
v_c3b5f286_c3c6_4616_abfb_14c938e99785 = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    notes = "Толпа не доверяет, приходится подслушать.Eng.++7",
    bgimg = function(s)
        if (true) then
            return 'images/005f21.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Заметив двух горожан, отстоящих несколько особняком, лемуриец решил подслушать их разговор. Подобравшись к ним как можно ближе, Рагнар сделал вид будто читает объявление.");
pn();
pn("");
pn();
pn("– Говорят, управляющий предлагает очень большие деньги, – прошепелявил один.");
pn();
pn("");
pn();
pn("– Нет такого человека, который смог бы их заработать, – хмыкнул другой.");
pn();
pn("");
pn();
pn("– Надо чтобы кто-нибудь  убил  уже это чудовище, а то мы так скоро без воды останемся, – вздохнул шепелявый.");
pn();
pn("");
pn();
pn("– Ага, только дураков нет. Вот ты бы пошёл?");
pn();
pn("");
pn();
pn("– Я?! Нет, я не могу, у меня...");
pn();
pn("");
pn();
pn("Дослушивать Рагнар не стал. Он получил всю необходимую информацию и решил немедленно отправиться прямо к управляющему.");
pn();
    end,
    walk_to = "v_c3b5f286_c3c6_4616_abfb_14c938e99785_choices",
    autos = function(s)
        nlb:revive();
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_c3b5f286_c3c6_4616_abfb_14c938e99785_snds');
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
nlb:setAchievement(statsAPI, 'A_CONVERSATION');
        end;
        s.snd(s);
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
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
    end,
    sndout = function(s) end,
};

v_c3b5f286_c3c6_4616_abfb_14c938e99785_choices = room {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        nlb:nlbwalk(s, v_63386fc4_cf68_4ba4_ab21_2695bc1f6d4c); 
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 29
v_f17f49bc_84fb_475c_9e0c_9c1334b55bcf = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    notes = "29",
    bgimg = function(s)

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Конец демо-версии.");
pn();
    end,
    walk_to = "v_f17f49bc_84fb_475c_9e0c_9c1334b55bcf_choices",
    autos = function(s)
        nlb:revive();
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_f17f49bc_84fb_475c_9e0c_9c1334b55bcf_snds');
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
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
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
    end,
    sndout = function(s) end,
};

v_f17f49bc_84fb_475c_9e0c_9c1334b55bcf_choices = room {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    dsc = img 'blank:23x23'..'^'..fend:txt('The')..img 'blank:64x64'..fend:txt('End'),
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        put(_try_again);
        vn:geom(530, 400, 860, 184, 'dissolve', 240);
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- Рагнар шествует по городу++2
v_91101978_4d17_45f3_8743_cbff85865c74 = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    notes = "Рагнар шествует по городу++2",
    bgimg = function(s)
        if (true) then
            return 'images/001f1.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Рагнар неторопливо шествовал по городу. Повсюду, как обычно, было полно народу. Местные жители и приезжие с наступлением утра высыпали на улицы, образуя шумные, пёстрые потоки, оживляющие город, ночью казавшийся пустым и безжизненным.");
pn();
pn(" Яркое солнце нещадно палило и мускулистое тело лемурийца лоснилось в его лучах, внушая уважение мужчинам и рождая восхищение в глазах женщин.");
pn();
pn("");
pn();
    end,
    walk_to = "v_91101978_4d17_45f3_8743_cbff85865c74_choices",
    autos = function(s)
        nlb:revive();
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_91101978_4d17_45f3_8743_cbff85865c74_snds');
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
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
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
            set_music('sound/1.ogg', 0);
    end,
    sndout = function(s) end,
};

v_91101978_4d17_45f3_8743_cbff85865c74_choices = room {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        nlb:nlbwalk(s, v_5d207fa8_4254_44ed_8cba_dbaa7bdd17de); 
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- Р видит Г++14
v_3ce55ed6_f5ef_4d33_a124_76fe54091feb = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    notes = "Р видит Г++14",
    bgimg = function(s)
        if (true) then
            return 'images/009f21.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Продолжая прогулку по городу, Рагнар вскоре очутился неподалёку от храма. Лемуриец решил посетить дом божества которому поклонялся, но проходя мимо храма Ханумана, расположенного на той же улице, заметил пристальный взгляд человека в ритуальной одежде жреца. Рагнар остановился, и служитель Ханумана тут же направился к нему.");
pn();
    end,
    walk_to = "v_3ce55ed6_f5ef_4d33_a124_76fe54091feb_choices",
    autos = function(s)
        nlb:revive();
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_3ce55ed6_f5ef_4d33_a124_76fe54091feb_snds');
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
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
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
            set_music('sound/4.ogg', 0);
    end,
    sndout = function(s) end,
};

v_3ce55ed6_f5ef_4d33_a124_76fe54091feb_choices = room {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        nlb:nlbwalk(s, v_af9e18c5_dfa6_4c78_ac09_1abbc44ff9f5); 
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- !НОВАЯ!
v_64602633_9457_4d5d_af7e_79afe815c2e6 = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    notes = "!НОВАЯ!",
    bgimg = function(s)
        if (true) then
            return 'images/016.1f42.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("...и решительно шагнул внутрь.");
pn();
    end,
    walk_to = "v_64602633_9457_4d5d_af7e_79afe815c2e6_choices",
    autos = function(s)
        nlb:revive();
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_64602633_9457_4d5d_af7e_79afe815c2e6_snds');
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
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
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
    end,
    sndout = function(s) end,
};

v_64602633_9457_4d5d_af7e_79afe815c2e6_choices = room {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        nlb:nlbwalk(s, v_f17f49bc_84fb_475c_9e0c_9c1334b55bcf); 
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- Увидел девушку++3
v_5d207fa8_4254_44ed_8cba_dbaa7bdd17de = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    notes = "Увидел девушку++3",
    bgimg = function(s)
        if (true) then
            return 'images/2.2f22.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Одна из девушек, то и дело мелькавших в толпе, показалась мужчине особенно привлекательной: стройная фигура с пленительными изгибами, пышная грудь, чётко вырисовывающаяся под тонкой тканью накидки, длинные волосы, стянутые на затылке в хвост, тёмные выразительные глаза и полные губы, заставили мужчину последовать за ней.");
pn();
pn(" Но незнакомка, свернув в один из многочисленных переулков, затерялась в толпе.");
pn();
pn("");
pn();
pn("");
pn();
pn("– Проклятье, – пробормотал Рагнар. И решив про себя, что позже обязательно отыщет красотку, двинулся дальше.");
pn();
    end,
    walk_to = "v_5d207fa8_4254_44ed_8cba_dbaa7bdd17de_choices",
    autos = function(s)
        nlb:revive();
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_5d207fa8_4254_44ed_8cba_dbaa7bdd17de_snds');
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
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
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
    end,
    sndout = function(s) end,
};

v_5d207fa8_4254_44ed_8cba_dbaa7bdd17de_choices = room {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        nlb:nlbwalk(s, v_20812e7b_9e70_448d_a3f4_38847f5f721e); 
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 
v_32260bf6_bab2_4ebc_8f17_dd1ab32dfaf9 = room {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
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
        if (true) then                 nlb:nlbwalk(s, v_e832edcc_854c_4cb6_892f_e8f38d416c5b); 
        return false;
 end;
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_32260bf6_bab2_4ebc_8f17_dd1ab32dfaf9_snds');
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
_money = 150;
            nlb:addf(v_2377b00b_74e5_4c1d_881e_07c2e37409dc, v_f97b1d23_0644_4154_8a37_5de4e9e9139b, false);
_rewardAzalia = 3000;
_can_remove_skill =  false ;
        end;
        s.snd(s);
        s.add_gobj(s);
        s.autos(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        vn:scene(bg_img);
        if v_a660978e_1eee_43ec_9aed_6e68b12d20a8.preload then
            v_a660978e_1eee_43ec_9aed_6e68b12d20a8:preload();
        else
            vn:gshow(v_a660978e_1eee_43ec_9aed_6e68b12d20a8);
        end
        if v_e77a748a_b7b2_4473_9c13_6d90ec3d8a30.preload then
            v_e77a748a_b7b2_4473_9c13_6d90ec3d8a30:preload();
        else
            vn:gshow(v_e77a748a_b7b2_4473_9c13_6d90ec3d8a30);
        end
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

-- ++22
v_7b682a63_6c7d_4a2a_88e3_1ce70e121d0c = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    notes = "++22",
    bgimg = function(s)
        if (true) then
            return 'images/013.1f21.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("– А ты, видно, не здешний, – неожиданно обратился один из них к Рагнару.");
pn();
pn("– Да, я из Лемурии.");
pn();
pn("– Выпьешь с нами? – поинтересовался другой. И, не дожидаясь ответа, плеснул в кружку Рагнара из своего кувшина со словами:");
pn();
pn("– Чокнемся, ребята!");
pn();
    end,
    walk_to = "v_7b682a63_6c7d_4a2a_88e3_1ce70e121d0c_choices",
    autos = function(s)
        nlb:revive();
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_7b682a63_6c7d_4a2a_88e3_1ce70e121d0c_snds');
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
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
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
            set_music('sound/7.ogg', 0);
    end,
    sndout = function(s) end,
};

v_7b682a63_6c7d_4a2a_88e3_1ce70e121d0c_choices = room {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        nlb:nlbwalk(s, v_7c3a320e_25dd_4a9c_96ed_d33937ef4e82); 
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- ++24
v_26712782_4b4c_4765_964c_9f94e42664c7 = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    notes = "++24",
    bgimg = function(s)
        if (true) then
            return 'images/013.2f21.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("– А давайте его поймаем! – воскликнул юноша, подняв голову и стукнув кулаком по столу.");
pn();
pn("– Кого? – не понял долговязый.");
pn();
pn("– Чудище!");
pn();
pn("Все затихли, но через мгновение начали подниматься, роняя стулья, и со словами:");
pn();
pn("\"Убьём зверя! Отомстим за наших!\" – направились к выходу.");
pn();
pn("– Чужестранец, ты с нами? – спросил кто-то из них.");
pn();
pn("– Да, я с вами! Мы поймаем чудище, клянусь богами! – отозвался Рагнар и, проглотив остатки вина, вышел следом за водовозами.");
pn();
    end,
    walk_to = "v_26712782_4b4c_4765_964c_9f94e42664c7_choices",
    autos = function(s)
        nlb:revive();
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_26712782_4b4c_4765_964c_9f94e42664c7_snds');
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
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
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
    end,
    sndout = function(s) end,
};

v_26712782_4b4c_4765_964c_9f94e42664c7_choices = room {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        nlb:nlbwalk(s, v_c85aaca4_13c6_48f6_a3e5_75149c250071); 
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- У говорит К победить Ч++11
v_efe34ea2_36f0_4aa1_a6b4_ef7678854589 = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    notes = "У говорит К победить Ч++11",
    bgimg = function(s)
        if (true) then
            return 'images/021f1.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("– Как тебя зовут?");
pn();
pn("– Рагнар из Лемурии, – ответил мужчина, садясь на мягкие подушки. Заметив, как прогнулся диван под тяжестью посетителя, управляющий на мгновение замер, но через секунду почувствовал себя увереннее, так как оставшись стоять, был теперь немного выше гостя.");
pn();
pn("– У нас в городе исчезают люди, – начал Абу Али, – в частности пропали несколько водовозов. По всей видимости чудище подстерегало их у колодца, в котором они набирают воду.");
pn();
pn("– Почему вы так решили?");
pn();
pn("– Там несколько раз видели следы не-че-ло-ве-чес-кие. Вероятно, чудовище обитает в пещерах, расположенных под колодцем. Что скажешь, могучий воин, берёшься ли ты убить тварь?");
pn();
pn("– Какова будет награда? – поинтересовался Рагнар. Его суровый взгляд заставил управляющего поёжиться.");
pn();
pn("– Я предлагаю хорошие деньги: тысячу монет.");
pn();
pn("От услышанного на лице лемурийца появилась довольная улыбка.");
pn();
pn("– Отлично, я согласен, – с этими словами он резко поднялся с дивана. – В доказательство выполненной работы я принесу его голову, – произнёс Рагнар направляясь к выходу.");
pn();
pn("Абу Али с облегчением выдохнул, радуясь окончанию этой встречи. Уж слишком грозным  и даже диким показался ему вид этого посетителя.");
pn();
    end,
    walk_to = "v_efe34ea2_36f0_4aa1_a6b4_ef7678854589_choices",
    autos = function(s)
        nlb:revive();
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_efe34ea2_36f0_4aa1_a6b4_ef7678854589_snds');
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
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
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
    end,
    sndout = function(s) end,
};

v_efe34ea2_36f0_4aa1_a6b4_ef7678854589_choices = room {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if ( not _perception) then
        nlb:nlbwalk(s, v_51c9e622_bd05_4ff8_95c1_f0d611c381f1); 
end;
if (_perception) then
        nlb:nlbwalk(s, v_33e9cbc4_b5d3_45c7_abfa_e8e40411398f); 
end;
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- Управляющий здоровается++9
v_fc39768c_3036_4995_95d2_41d41e2b46a9 = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    notes = "Управляющий здоровается++9",
    bgimg = function(s)
        if (true) then
            return 'images/021.1f1.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Его встретил невысокий, полноватый мужчина в длинных парчовых одеждах, чалму на голове украшала брошь с крупным самоцветом.");
pn();
pn("– Приветствую тебя, воин, – вкрадчиво произнёс управляющий и его тонкие усики, плавно переходящие в небольшую бородку, растянулись в улыбке.");
pn();
    end,
    walk_to = "v_fc39768c_3036_4995_95d2_41d41e2b46a9_choices",
    autos = function(s)
        nlb:revive();
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_fc39768c_3036_4995_95d2_41d41e2b46a9_snds');
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
nlb:setAchievement(statsAPI, 'THE_CHAMBERLAIN');
        end;
        s.snd(s);
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
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
    end,
    sndout = function(s) end,
};

v_fc39768c_3036_4995_95d2_41d41e2b46a9_choices = room {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        nlb:nlbwalk(s, v_9ed5e386_11bf_4d0f_bb3a_8bcbce106ee9); 
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- ++21
v_718c5b98_0c2a_4cd1_9c06_7d3c96fd6034 = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    notes = "++21",
    bgimg = function(s)
        if (true) then
            return 'images/013.1f21.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("С трудом отыскав за столиком свободное место, Рагнар подсел к подвыпившей компании и, как обычно, заказал себе кувшин арака.");
pn();
pn(" Судя по всему, расположившиеся за столом мужчины являлись простыми работягами: крепкие, загорелые, бедно одетые они потягивали самое дешёвое вино.");
pn();
pn("");
pn();
    end,
    walk_to = "v_718c5b98_0c2a_4cd1_9c06_7d3c96fd6034_choices",
    autos = function(s)
        nlb:revive();
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_718c5b98_0c2a_4cd1_9c06_7d3c96fd6034_snds');
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
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
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
    end,
    sndout = function(s) end,
};

v_718c5b98_0c2a_4cd1_9c06_7d3c96fd6034_choices = room {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        nlb:nlbwalk(s, v_7b682a63_6c7d_4a2a_88e3_1ce70e121d0c); 
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- ++20
v_353dc8a2_8ec5_4fa6_b00c_ffd1642d2377 = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    notes = "++20",
    bgimg = function(s)
        if (true) then
            return 'images/011f21.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Завершив игру, Рагнар решил переместиться в другую часть кабака чтобы спокойно выпить ещё немного вина. Его место тут же занял очередной игрок, желающий испытать удачу.");
pn();
    end,
    walk_to = "v_353dc8a2_8ec5_4fa6_b00c_ffd1642d2377_choices",
    autos = function(s)
        nlb:revive();
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_353dc8a2_8ec5_4fa6_b00c_ffd1642d2377_snds');
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
if ((_money ~= nil) and (_money >= 1000)) then
nlb:setAchievement(statsAPI, 'FORTUNES_FAVORITE');
end;
        end;
        s.snd(s);
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
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
            set_music('sound/6.ogg', 0);
    end,
    sndout = function(s) end,
};

v_353dc8a2_8ec5_4fa6_b00c_ffd1642d2377_choices = room {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        nlb:nlbwalk(s, v_718c5b98_0c2a_4cd1_9c06_7d3c96fd6034); 
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- Пещеры вход Eng++30
v_b4244a87_6a99_4146_806c_23528bd9752c = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    notes = "Пещеры вход Eng++30",
    bgimg = function(s)
        if (true) then
            return 'images/014f21.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("У входа в подземелье воин зажёг предусмотрительно взятый факел...");
pn();
    end,
    walk_to = "v_b4244a87_6a99_4146_806c_23528bd9752c_choices",
    autos = function(s)
        nlb:revive();
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_b4244a87_6a99_4146_806c_23528bd9752c_snds');
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
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
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
    end,
    sndout = function(s) end,
};

v_b4244a87_6a99_4146_806c_23528bd9752c_choices = room {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        nlb:nlbwalk(s, v_64602633_9457_4d5d_af7e_79afe815c2e6); 
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- Попытка получить инфу силой. Пойманный горожанин пытается отмазаться, говоря, что не знает (Ложь).Eng.++8
v_aaeb491e_a859_480b_926b_86cedb7a466f = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    notes = "Попытка получить инфу силой. Пойманный горожанин пытается отмазаться, говоря, что не знает (Ложь).Eng.++8",
    bgimg = function(s)
        if (true) then
            return 'images/006f21.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("– Послушай, любезнейший, что здесь написано? – наконец обратился лемуриец к бородатому здоровяку. Но тот, взглянув на огромные мускулы и суровое лицо Рагнара, только округлил глаза и промямлил:");
pn();
pn("– Не знаю, господин, я неграмотный. И поспешил убраться подальше. Иногда облик лемурийца оказывал ему медвежью услугу.");
pn();
    end,
    walk_to = "v_aaeb491e_a859_480b_926b_86cedb7a466f_choices",
    autos = function(s)
        nlb:revive();
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_aaeb491e_a859_480b_926b_86cedb7a466f_snds');
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
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
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
    end,
    sndout = function(s) end,
};

v_aaeb491e_a859_480b_926b_86cedb7a466f_choices = room {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if (_insight) then
        put(v_bec0cc46_5b58_49a9_aa53_376719b11f72);
end;
if (_hearing) then
        put(v_6cccbbce_5d3d_44a3_9547_136b5445f9be);
end;
        put(v_8f15736d_ba50_4d87_b65f_dd62838940c8);
        put(v_9cfff439_87a1_4ebc_b920_384c2a3d2101);
if (_can_read) then
        put(v_2c468bd2_055c_489c_acf1_5721d460a56c);
end;
        vn:geom(320, 320, 1280, 480, 'dissolve');
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

v_bec0cc46_5b58_49a9_aa53_376719b11f72 = menu {
    nam = "v_bec0cc46_5b58_49a9_aa53_376719b11f72",
    dsc = function(s) return "{Припугнуть горожанина}^^" end, 
    act = function(s) 
        nlb:nlbwalk(s, v_1d11ce4b_3a3c_4d8f_93eb_3a9750ba4cb2); 
    end
}

v_6cccbbce_5d3d_44a3_9547_136b5445f9be = menu {
    nam = "v_6cccbbce_5d3d_44a3_9547_136b5445f9be",
    dsc = function(s) return "{Подслушать разговор двух горожан}^^" end, 
    act = function(s) 
        nlb:nlbwalk(s, v_c3b5f286_c3c6_4616_abfb_14c938e99785); 
    end
}

v_8f15736d_ba50_4d87_b65f_dd62838940c8 = menu {
    nam = "v_8f15736d_ba50_4d87_b65f_dd62838940c8",
    dsc = function(s) return "{Пойти в кабак выпить}^^" end, 
    act = function(s) 
        nlb:nlbwalk(s, v_0f6077c1_d771_4451_be1c_939bfd40332b); 
    end
}

v_9cfff439_87a1_4ebc_b920_384c2a3d2101 = menu {
    nam = "v_9cfff439_87a1_4ebc_b920_384c2a3d2101",
    dsc = function(s) return "{Ещё погулять по городу}^^" end, 
    act = function(s) 
        nlb:nlbwalk(s, v_3ce55ed6_f5ef_4d33_a124_76fe54091feb); 
    end
}

v_2c468bd2_055c_489c_acf1_5721d460a56c = menu {
    nam = "v_2c468bd2_055c_489c_acf1_5721d460a56c",
    dsc = function(s) return "{Подойти и прочитать листовку}^^" end, 
    act = function(s) 
        nlb:nlbwalk(s, v_fc92ebe0_b3e5_463b_8541_243bede96afc); 
    end
}

-- Напуганный горожанин рассказывает правду.Eng.++13
v_1d11ce4b_3a3c_4d8f_93eb_3a9750ba4cb2 = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    notes = "Напуганный горожанин рассказывает правду.Eng.++13",
    bgimg = function(s)
        if (true) then
            return 'images/007f21.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Бородач явно врал. Рассердившись, Рагнар положил руку ему на плечо и  раньше, чем тот успел сообразить, что происходит, утянул в узкий переулок.");
pn();
pn("– Я видел, как ты читал объявление, говори, что там написано, и я сразу тебя отпущу, только не вздумай врать! – Ну! – Рагнар слегка встряхнул бородача.");
pn();
pn("– Там, там надо убить чудовище, – заикаясь, наконец  произнёс  здоровяк, – и, и управляющий наградит.");
pn();
pn("Справедливо рассудив, что все подробности можно выяснить у того, кто платит, Рагнар, оставив горожанина в покое, к великому облегчению последнего, отправился прямиком к управляющему.");
pn();
    end,
    walk_to = "v_1d11ce4b_3a3c_4d8f_93eb_3a9750ba4cb2_choices",
    autos = function(s)
        nlb:revive();
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_1d11ce4b_3a3c_4d8f_93eb_3a9750ba4cb2_snds');
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
nlb:setAchievement(statsAPI, 'INFORMATION_COLLECTOR');
        end;
        s.snd(s);
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
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
            set_music('sound/26.ogg', 0);
    end,
    sndout = function(s) end,
};

v_1d11ce4b_3a3c_4d8f_93eb_3a9750ba4cb2_choices = room {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        nlb:nlbwalk(s, v_63386fc4_cf68_4ba4_ab21_2695bc1f6d4c); 
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- Когда Рагнар проходит мимо храма Ханумана, его окликает жрец и даёт задание убить чудище и отдать ему его медальон.Eng.++16
v_af9e18c5_dfa6_4c78_ac09_1abbc44ff9f5 = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    notes = "Когда Рагнар проходит мимо храма Ханумана, его окликает жрец и даёт задание убить чудище и отдать ему его медальон.Eng.++16",
    bgimg = function(s)
        if (true) then
            return 'images/012f21.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("– Приветствую тебя, чужестранец, – начал жрец, – позволь узнать твоё имя и цель визита в наш город?");
pn();
pn("– Я путешествую в поисках заработка, – ответил Рагнар, разглядывая невысокого худощавого человечка с гладко выбритым лицом и головой.");
pn();
pn("– Вот это совпадение, а я как раз ищу человека, который мог бы помочь мне. Кстати, меня зовут Горро, – он слегка склонил голову в знак уважения.");
pn();
pn(" Я вижу ты великий воин, сильный и храбрый, – с некоторым пафосом произнёс жрец, – только такой сможет справиться с чудовищем.");
pn();
pn("");
pn();
pn("Рагнар спокойно, даже равнодушно слушал жреца, но оживился при слове \"чудовище\":");
pn();
pn("– Его надо убить или поймать?");
pn();
pn("– Да, умертвить. Во-первых, оно ловит и пожирает людей, а, во-вторых, у зверя находится одна вещица, медальон, который принадлежит мне. Верни его и я щедро тебя вознагражу.");
pn();
pn("– Верно ли я понял, жрец, что самое главное это достать украшение и даже если чудище не будет убито я всё равно получу свою плату? – Без обиняков спросил Рагнар.");
pn();
pn("– Конечно лучше будет довести дело до конца, – замялся служитель Ханумана, – но в общем ты верно истолковал мою просьбу.");
pn();
pn("– Хорошо, – дольше не раздумывая ответил лемуриец, – где мне найти чудище?");
pn();
pn("– Оно обитает в пещерах, неподалёку от колодца водовозов. Когда ты сможешь отправиться туда?");
pn();
pn("– Завтра утром, – решительно ответил воин.");
pn();
    end,
    walk_to = "v_af9e18c5_dfa6_4c78_ac09_1abbc44ff9f5_choices",
    autos = function(s)
        nlb:revive();
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_af9e18c5_dfa6_4c78_ac09_1abbc44ff9f5_snds');
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
nlb:setAchievement(statsAPI, 'THE_PRIEST');
_forArtifact = true;
        end;
        s.snd(s);
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
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
    end,
    sndout = function(s) end,
};

v_af9e18c5_dfa6_4c78_ac09_1abbc44ff9f5_choices = room {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
if ( not _perception) then
        nlb:nlbwalk(s, v_51c9e622_bd05_4ff8_95c1_f0d611c381f1); 
end;
if (_perception) then
        nlb:nlbwalk(s, v_33e9cbc4_b5d3_45c7_abfa_e8e40411398f); 
end;
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- Водовозы рассказывают о чудище, которое живёт в пещерах. Говорят, что оно разговоривает человеским голосом! Они напиваются и решают его поймать.Eng.++15
v_0f6077c1_d771_4451_be1c_939bfd40332b = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    notes = "Водовозы рассказывают о чудище, которое живёт в пещерах. Говорят, что оно разговоривает человеским голосом! Они напиваются и решают его поймать.Eng.++15",
    bgimg = function(s)
        if (true) then
            return 'images/010f21.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("– Чёрт побери, – выругался Рагнар. Ладно, рано или поздно я всё равно узнаю что происходит в этом городе. Наверняка через пару часов эту информацию будут обсуждать на каждом углу.");
pn();
pn("Между тем, солнце припекало всё сильнее, хотя казалось что это уже невозможно. В горле давно пересохло, и лемуриец направился в ближайший кабак.");
pn();
    end,
    walk_to = "v_0f6077c1_d771_4451_be1c_939bfd40332b_choices",
    autos = function(s)
        nlb:revive();
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_0f6077c1_d771_4451_be1c_939bfd40332b_snds');
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
_forFun = true;
        end;
        s.snd(s);
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
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
            set_music('sound/5.ogg', 0);
    end,
    sndout = function(s) end,
};

v_0f6077c1_d771_4451_be1c_939bfd40332b_choices = room {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        nlb:nlbwalk(s, v_cd01ced2_7870_4e4e_82ad_f92e39ea74f3); 
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- Рагнар у колодца. Есть восприятие.Eng.++32
v_33e9cbc4_b5d3_45c7_abfa_e8e40411398f = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    notes = "Рагнар у колодца. Есть восприятие.Eng.++32",
    bgimg = function(s)
        if (true) then
            return 'images/017f21.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Когда первый луч солнца, показавшись из-за горизонта, озарил небо и побежал по земле, Рагнар уже стоял у колодца.");
pn();
pn(" Здесь, в засохшей грязи, застыло множество следов. Бугорки на земле отбрасывали причудливые тени в лучах восходящего солнца.");
pn();
pn("");
pn();
    end,
    walk_to = "v_33e9cbc4_b5d3_45c7_abfa_e8e40411398f_choices",
    autos = function(s)
        nlb:revive();
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_33e9cbc4_b5d3_45c7_abfa_e8e40411398f_snds');
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
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
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
            set_music('sound/3.ogg', 0);
    end,
    sndout = function(s) end,
};

v_33e9cbc4_b5d3_45c7_abfa_e8e40411398f_choices = room {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        nlb:nlbwalk(s, v_db483768_ee36_4389_a616_d42dadb8662e); 
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- Управляющий предлагает гостю присесть++10
v_9ed5e386_11bf_4d0f_bb3a_8bcbce106ee9 = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    notes = "Управляющий предлагает гостю присесть++10",
    bgimg = function(s)
        if (true) then
            return 'images/019f1.png';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("– Я Абу Али Абухар, управляющий этого города. Прошу тебя, проходи, присаживайся.");
pn();
pn("Приглашая гостя занять место на одном из мягких диванов, управляющий сделал плавный жест рукой, при этом сверкнул крупный рубин, вставленный в массивный перстень, украшающий пухлый палец.");
pn();
    end,
    walk_to = "v_9ed5e386_11bf_4d0f_bb3a_8bcbce106ee9_choices",
    autos = function(s)
        nlb:revive();
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_9ed5e386_11bf_4d0f_bb3a_8bcbce106ee9_snds');
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
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
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
    end,
    sndout = function(s) end,
};

v_9ed5e386_11bf_4d0f_bb3a_8bcbce106ee9_choices = room {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        nlb:nlbwalk(s, v_efe34ea2_36f0_4aa1_a6b4_ef7678854589); 
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- 18
v_c70a01be_0d99_4c1b_b759_0b5f1fee6378 = room {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    notes = "18",
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
        if ((_played_two_ais ~= nil) and (_played_two_ais > 1)) then                 nlb:nlbwalk(s, v_353dc8a2_8ec5_4fa6_b00c_ffd1642d2377); 
        return false;
 end;
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_c70a01be_0d99_4c1b_b759_0b5f1fee6378_snds');
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
if ((_played_two_ais ~= nil) and (_played_two_ais < 1)) then
nlb:actf(_play_bp_two_ais);
_played_two_ais = _played_two_ais + 1;
else
_played_two_ais = _played_two_ais + 1;
end;
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

-- Р видит следы Ч++31
v_db483768_ee36_4389_a616_d42dadb8662e = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    notes = "Р видит следы Ч++31",
    bgimg = function(s)
        if (true) then
            return 'images/018f21.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Кроме отпечатков грубых башмаков Рагнар заметил следы лап чудовища: раза в полтора крупнее его собственной ступни, с четырьмя плотно прижатыми друг к другу пальцами.");
pn();
pn(" Они покрывали землю вокруг колодца в радиусе около двух метров, но никуда не вели. Также, от внимания мужчины не укрылась ещё одна, необычная для этого места, пара следов: некрупные, аккуратные, в плотно прилегающей дорогой обуви, в отличие от простых деревянных башмаков водовозов.");
pn();
pn(" Интересным являлся и тот факт, что отпечатки этих ног имелись только на дорожке, ведущей к колодцу, и около кустов неподалёку. Задумчиво хмыкнув, Рагнар направился к пещерам.");
pn();
pn("");
pn();
    end,
    walk_to = "v_db483768_ee36_4389_a616_d42dadb8662e_choices",
    autos = function(s)
        nlb:revive();
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_db483768_ee36_4389_a616_d42dadb8662e_snds');
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
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
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
    end,
    sndout = function(s) end,
};

v_db483768_ee36_4389_a616_d42dadb8662e_choices = room {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        nlb:nlbwalk(s, v_b4244a87_6a99_4146_806c_23528bd9752c); 
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- Покажем этому чудищу!++26
v_ddbaab34_2220_4026_be47_c6ecbd14a1f6 = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    notes = "Покажем этому чудищу!++26",
    bgimg = function(s)
        if (true) then
            return 'images/015.1f25.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("– Посмотрим, что скажет эта тварь когда мы нагрянем к ней в логово, – сказал лемуриец, наматывая ветошь на толстую сучковатую палку, и обернувшись к водовозам воскликнул: –  Скоро это чудище поплатится за воровство людей!");
pn();
pn("– Да, да поплатится, – отозвались несколько голосов, в которых, к тому времени, уже не было прежней уверенности.");
pn();
    end,
    walk_to = "v_ddbaab34_2220_4026_be47_c6ecbd14a1f6_choices",
    autos = function(s)
        nlb:revive();
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_ddbaab34_2220_4026_be47_c6ecbd14a1f6_snds');
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
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
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
    end,
    sndout = function(s) end,
};

v_ddbaab34_2220_4026_be47_c6ecbd14a1f6_choices = room {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        nlb:nlbwalk(s, v_0d8b475f_1758_4125_9cd9_8db11611e2c1); 
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- Рагнар шагнул в подземелье ++27
v_0d8b475f_1758_4125_9cd9_8db11611e2c1 = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    notes = "Рагнар шагнул в подземелье ++27",
    bgimg = function(s)
        if (true) then
            return 'images/016f25.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Завершив нехитрые приготовления, Рагнар, со словами: \"Пошли, ребята!\" – махнул своим спутникам, предлагая следовать за ним, и решительно шагнул в подземелье.");
pn();
    end,
    walk_to = "v_0d8b475f_1758_4125_9cd9_8db11611e2c1_choices",
    autos = function(s)
        nlb:revive();
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_0d8b475f_1758_4125_9cd9_8db11611e2c1_snds');
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
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
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
    end,
    sndout = function(s) end,
};

v_0d8b475f_1758_4125_9cd9_8db11611e2c1_choices = room {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        nlb:nlbwalk(s, v_70a81846_e3ff_4044_869d_e4673cc16cfe); 
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- !НОВАЯ!
v_f0407786_138b_4ef6_b94c_3dd25b95a2c4 = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    notes = "!НОВАЯ!",
    bgimg = function(s)
        if (true) then
            return 'images/006f21.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Рагнар обладал огромной силой, высоким ростом и весьма брутальной внешностью, которая производила на людей неизгладимое впечатление: в женщинах воспламеняя чувства, а мужчин заставляя трепетать от страха.");
pn();
pn("Зная, какое действие его внешность оказывает на людей, он взглядом искал в толпе отнюдь не самого хилого горожанина.");
pn();
    end,
    walk_to = "v_f0407786_138b_4ef6_b94c_3dd25b95a2c4_choices",
    autos = function(s)
        nlb:revive();
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_f0407786_138b_4ef6_b94c_3dd25b95a2c4_snds');
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
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
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
    end,
    sndout = function(s) end,
};

v_f0407786_138b_4ef6_b94c_3dd25b95a2c4_choices = room {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        nlb:nlbwalk(s, v_aaeb491e_a859_480b_926b_86cedb7a466f); 
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- Рагнар с водовозами у пещер.Eng.25
v_c85aaca4_13c6_48f6_a3e5_75149c250071 = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    notes = "Рагнар с водовозами у пещер.Eng.25",
    bgimg = function(s)
        if (true) then
            return 'images/015f21.jpg';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Когда весёлая компания добралась до входа в пещеры, солнце уже клонилось к закату. Пока Рагнар сооружал факел из валявшихся повсюду веток и разного мусора, водовозы тихо стояли поодаль.");
pn();
    end,
    walk_to = "v_c85aaca4_13c6_48f6_a3e5_75149c250071_choices",
    autos = function(s)
        nlb:revive();
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_c85aaca4_13c6_48f6_a3e5_75149c250071_snds');
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
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
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
            set_music('sound/8.ogg', 0);
    end,
    sndout = function(s) end,
};

v_c85aaca4_13c6_48f6_a3e5_75149c250071_choices = room {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        nlb:nlbwalk(s, v_ddbaab34_2220_4026_be47_c6ecbd14a1f6); 
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

-- Вступление Eng++1
v_e832edcc_854c_4cb6_892f_e8f38d416c5b = vnr {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    notes = "Вступление Eng++1",
    bgimg = function(s)
        if (true) then
            return 'images/262f23.png';
        end

    end,
    var { time = 0; wastext = false; lasttext = nil; tag = ''; autowired = false; },
    dsc = function(s)
pn("Рагнар уже много дней был в пути. И когда вдалеке замаячили каменные стены и башни очередного города, лемуриец обрадовался возможности передохнуть и пополнить запасы провизии. Плюс ко всему, в таких крупных поселениях часто удавалось ещё и подзаработать.");
pn();
    end,
    walk_to = "v_e832edcc_854c_4cb6_892f_e8f38d416c5b_choices",
    autos = function(s)
        nlb:revive();
        return true;
    end,
    nextsnd = function(s)
        local sndfile = nlb:pop('v_e832edcc_854c_4cb6_892f_e8f38d416c5b_snds');
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
nlb:actf(v_6309277f_d6cc_4dde_9826_9eedea4b322d);
nlb:actf(v_a660978e_1eee_43ec_9aed_6e68b12d20a8);
        end;
        s.snd(s);
        s.add_gobj(s);
    end,
    add_gobj = function(s)
        local bg_img = s.bgimg(s);
        nlb:revive();
        vn:scene(bg_img);
        local geomFuncNeedToCall = true;
        if geomFuncNeedToCall then
            vn:geom(8, 864, 1904, 184, 'dissolve', 240, function() s.autos(s); end);
        end;
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
            set_music('sound/3.ogg', 0);
    end,
    sndout = function(s) end,
};

v_e832edcc_854c_4cb6_892f_e8f38d416c5b_choices = room {
    nam = "The Barbarian and the Subterranean Caves (Demo)",
    disp = true,
    textbg = true,
    ignore_preserved_gobjs = true,
    var { paginator_state = false; },
    enter = function(s) 
        s.paginator_state = paginator.on;
        objs():zap();
        paginator:turnoff();
        nlb:nlbwalk(s, v_91101978_4d17_45f3_8743_cbff85865c74); 
    end,
    exit = function(s) 
        if s.paginator_state then paginator:turnon(); end;
    end
}

