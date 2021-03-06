package org.opencloudengine.garuda.web.token;

import org.opencloudengine.garuda.web.console.oauthclient.OauthClient;
import org.opencloudengine.garuda.web.console.oauthuser.OauthUser;

public interface OauthTokenService {

    OauthCode insertCode(OauthCode oauthCode);

    OauthCode selectCodeById(String id);

    OauthCode selectCodeByCode(String code);

    OauthCode selectCodeByCodeAndClientId(String code, String clientId);

    void deleteCodeById(String id);

    OauthAccessToken insertToken(OauthAccessToken oauthAccessToken);

    OauthAccessToken selectTokenById(String id);

    OauthAccessToken selectTokenByToken(String token);

    OauthAccessToken selectTokenByOldRefreshToken(String refreshToken);

    OauthAccessToken selectTokenByRefreshToken(String refreshToken);

    OauthAccessToken selectTokenByManagementIdAndId(String managementId, String id);

    OauthAccessToken updateTokenById(OauthAccessToken oauthAccessToken);

    void deleteTokenById(String id);

    String generateJWTToken(OauthUser oauthUser, OauthClient oauthClient, OauthAccessToken accessToken, String claimJson, Integer lifetime, String type) throws Exception;
}
