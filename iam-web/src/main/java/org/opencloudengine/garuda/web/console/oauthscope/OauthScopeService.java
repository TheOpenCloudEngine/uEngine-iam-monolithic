package org.opencloudengine.garuda.web.console.oauthscope;

import org.opencloudengine.garuda.web.console.oauthclient.OauthClientScopes;

import java.util.List;

public interface OauthScopeService {

    OauthScope selectById(String id);

    List<OauthScope> selectAllByManagementId(String managementId);

    List<OauthScope> selectByManagementId(String managementId, int limit, Long skip);

    List<OauthScope> selectByManagementLikeScopeName(String managementId, String scopeName, int limit, Long skip);


    Long countAllByManagementId(String managementId);

    Long countAllByManagementIdLikeScopeName(String managementId, String scopeName);


    OauthScope selectByManagementIdAndId(String managementId, String id);

    OauthScope selectByManagementIdAndName(String managementId, String name);

    OauthScope updateById(String id, String name, String description);

    OauthScope updateById(OauthScope oauthScope);

    void deleteById(String id);

    OauthScope createScope(String managementId, String name, String description);

    OauthClientScopes insertClientScopes(OauthClientScopes oauthClientScopes);

    List<OauthScope> selectClientScopes(String clientId);

    OauthScope selectClientScopesByScopeId(String clientId, String scopeId);

    void deleteClientScopes(String clientId);

    void deleteClientScopesByScopeId(String clientId, String scopeId);
}
