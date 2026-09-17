# GOVERNANCE

个人维护的公共仓库治理基线，供不同代码仓库复制后按需补充。它将治理分为：

- `A`：公共行动规则，约束工作如何进行；
- `G`：公共验收规则，可从完整 PR diff、提交、测试与验证记录中复核；
- `R-A`：目标仓库自己的行动补充；
- `R-G`：目标仓库自己的验收补充。

规则编号是永久身份。新增规则使用所属编号族尚未使用的最大编号之后一位；
规则移动时保留 ID，删除后的 ID 永不复用，仓库补充也不接续公共编号。

## 内容

- `AGENTS.md`：权限边界、证据要求、编号语义与治理路由；
- `docs/governance/workflow.md`：调查、Git、issue、PR 与文档流程；
- `docs/governance/engineering.md`：工程设计与接口约束；
- `docs/governance/verification.md`：测试与完成证据；
- `docs/governance/repository.md`：目标仓库的补充规则模板；
- `.agents/skills/`：设计、诊断、review 处理、PR 自审与跨仓库交接流程。

## 复制到新仓库

在本仓库根目录执行：

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

本仓库只提供可复制文件，不包含 submodule、生成器、同步脚本或版本清单。

## License

[MIT](LICENSE)
