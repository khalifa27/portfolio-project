Create View percentpopulationvaccinated as 

SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, sum(new_vaccinations) over (partition by dea.location order by dea.location, dea.date)
as rollingpeoplevaccinated
FROM portfolioproject.coviddeaths dea
join portfolioproject.covidvaccinations vac
on dea.location = vac.location 
and dea.date = vac.date
where dea.continent is not null 


