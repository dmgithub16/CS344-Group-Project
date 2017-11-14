-- This is a test user to facilitate project completion
INSERT INTO `344db`.`user`
(`id`,
`name`,
`campus_affiliation`,
`email`,
`phone_primary`,
`status`)
VALUES
('00000','test','test','test@winona.edu','0000000000','student');
--Here is how to load questions into the DB, this is the Review question set
INSERT INTO `344db`.`question`
(`id`,
`text`,
`type`)
VALUES
('001','Student Experience - Project includes opportunities for student involvement and/or will positively impact the student experience.','review'),
('002','Connection to Campus - Project directly addresses environmental sustainability on the WSU campus or in the capacity that on-campus activities directly influence environmental sustainability in the surrounding community.','review'),
('003','Feasibility and Institutional Support - Project is feasible and has support from appropriate campus individuals and entities. Individual students or student organizations must have the signature of a faculty or staff advisor who is committed to advising throughout project implementation.','review'),
('004','Appropriateness of Schedule and Budget Request - Project schedule and budget are reasonable and conform to established timelines, constraints and parameters.','review'),
('005','Accountability - Project includes mechanism for evaluation and follow-up. At a minimum, a project plan includes appropriate progress reports to the Sustainability Committee based on the duration of the project and a final report within 60 days following completion of the project.','review'),
('006','Innovation - Project is innovative in nature and does not include routine maintenance or code-compliant activities. Funding may support narrowing the gap between code-compliant and more sustainable alternatives.','review'),
('007','Environmental Benefits - Project demonstrates a reduction in WSU\'s carbon footprint or provides other environmental benefits such as water conservation, storm water management, biodiversity conservation, and waste minimization.','review'),
('008','Regional Connection - Project provides intellectual and emotional linkage with the unique landscape of the Driftless Area/ Mississippi River, as well as the cultural lifeways of this special place.','review'),
('009','Outreach and Education - Project considers interdisciplinary and experiential education and outreach opportunities and has included them as part of its implementation plan.','review'),
('010','Self Sufficiency - Project includes matching funds from sources beyond SGF or includes a plan for sustained funding.','review'),
('011','Potential for Broad Application - Project has potential to be scalable across the campus.','review'),
('012',' Cost/Benefit Analysis (as appropriate) - Project proposal outlines project payback, lifecycle costs and savings, etc.','review');