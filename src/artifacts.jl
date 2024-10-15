if VERSION < v"1.7"
  using Pkg.Artifacts: ensure_all_artifacts_installed, HostPlatform
else
  using Pkg.Artifacts: ensure_artifact_installed, select_downloadable_artifacts,
                       HostPlatform
  function ensure_all_artifacts_installed(artifacts_toml; platform)
    artifacts = select_downloadable_artifacts(artifacts_toml; platform)
    for name in keys(artifacts)
      ensure_artifact_installed(name, artifacts[name], artifacts_toml)
    end
  end
end
