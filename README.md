# GOVERNANCE

个人维护的公共仓库治理基线，供不同代码仓库复制后按需补充。它将治理分为：

- `A`：公共行动规则，约束工作如何进行；
- `G`：公共验收规则，可从完整 PR diff、提交、测试与验证记录中复核；
- `R-A`：目标仓库自己的行动补充；
- `R-G`：目标仓库自己的验收补充。

规则编号是永久身份。新增规则使用所属编号族尚未使用的最大编号之后一位；
规则移动时保留 ID，删除后的 ID 永不复用，仓库补充也不接续公共编号。

## 内容

- `AGENTS.md`：权限边界、证据要求与治理路由；
- `docs/governance/workflow.md`：调查、Git、issue、PR 与文档流程；
- `docs/governance/engineering.md`：工程设计与接口约束；
- `docs/governance/verification.md`：测试与完成证据；
- `docs/governance/meta.md`：规则身份、晋升条件与 seed/skill 分层；
- `docs/governance/delivery.md`：PR、main、制品、部署与发布证据；
- `docs/governance/repository.md`：目标仓库的补充规则模板；
- `seeds/`：可选的仓库、技术画像、GitHub 工作管理与交付初始化材料；
- `.agents/skills/`：设计、诊断、review、初始化、同步、工作管理、交付与跨仓库交接流程；
- `managed-files.txt`：公共基线同步所管理的文件清单。

## 复制到新仓库

使用 `repository-bootstrap` skill 先审计目标仓库，再按真实技术画像选择
seed。初始化默认拒绝覆盖任何已有路径，也不会修改远端 GitHub。

仅需复制完整公共基线到空白仓库时，可在本仓库根目录执行：

```bash
cp -R AGENTS.md .agents docs /path/to/new-repository/
```

该命令仅适用于尚未建立治理的新仓库。已有 `AGENTS.md`、`.agents` 或
`docs/governance` 的仓库必须逐文件合并，不能直接覆盖。

复制后，在 `docs/governance/repository.md` 中填写产品所有权、本地架构、
具体协议与工具、验证入口、发布流程和跨仓库依赖。项目特例先保留为仓库
补充；只有已证明具有跨仓库价值的规则才应进入公共基线。

任务的唯一要求是更新文档时，该更新视为紧急修复，直接提交并推送
`main`，不创建 `docs/` 分支。需要 PR 的任务只在 PR 刚创建以及准备终态
交付给用户时执行对抗式自审；checklist 使用 `- [x]`、`- [ ]`、`- [-]`
和 `- [~]`。

本仓库只提供可复制文件、可选 seed 与本地辅助脚本，不包含 submodule，
也不会让目标仓库动态继承此仓库。同步默认只报告差异；应用或远端 mutation
仍需要对目标仓库及动作的明确授权。

## 验证

修改托管清单、bootstrap 或同步工作流后运行：

```bash
scripts/test-managed-governance.sh
```

## License

[MIT](LICENSE)
